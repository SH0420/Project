package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {  //컨트롤러 부분
	
	private BoardService service;  // 단일 생성자 자동 주입
	
	//@RequestMapping(value="/list", method=RequestMethod.POST)  // 전체 목록을 가져오는 처리
	@RequestMapping("/list")
	public String list(Model model, @ModelAttribute BoardVO board) {
		log.info("list");
		
		//
		int total = service.getListCount(board);
		
		model.addAttribute("pageMaker", new PageDTO(board, total));
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("list", service.getList(board));
		model.addAttribute("board", board); //모델 객체에 담아 전달
		log.info(model);  //모델객체 로그찍어보기
		
		return "Community/FreeBoardList"; //커뮤니티/자유게시판리스트로 반환
	}
	
	//글 작성폼에 있는 카테고리 리스트 기능
	@RequestMapping("/register")
	public String register(Model model, @ModelAttribute BoardVO board, @ModelAttribute ReplyVO reply) {
		log.info("list");

		//
		model.addAttribute("cateList", service.getCategoryList(board));
		
		return "Community/FreeBoardWrite";
	}
	
	//글 작성하고 등록하는 처리
	@RequestMapping("/registerProc")             //업로드 파일 
   public String registerProc(Model model, MultipartHttpServletRequest mRequest, @ModelAttribute BoardVO board, MultipartHttpServletRequest mpRequest) {  // 커맨드 객체 BoardVO에서 값을 자동으로 받아서 생성
      // RedirectAttributes의 addFlashAttribute -> 한번 사용할 데이터를 이동하는 페이지에 정보 전달 
      log.info("list");
      
      if(board.getAttachList() != null) {
         board.getAttachList().forEach(attach -> log.info(attach));
      }
      
      log.info("================================");

      BoardAttachVO attchVO = new BoardAttachVO();
      MultipartFile uploadFile = mRequest.getFile("uploadFile");
      
      if(!uploadFile.isEmpty()) {
    	  String uploadPath = "C:\\upload\\";
          File dir = new File(uploadPath);
          
          //디렉토리 없으면 생성시킴.
          if(!dir.exists()) {
             dir.mkdirs();
          }
          
          UUID uuid = UUID.randomUUID();
          attchVO.setUuid(uuid.toString());
          attchVO.setFileName(uuid.toString() +"_"+uploadFile.getOriginalFilename());
          attchVO.setUploadPath(uploadPath);
          File file = new File(uploadPath+attchVO.getFileName());
          
          try {
             uploadFile.transferTo(file);
          }catch(Exception e) {
             log.error(e.getMessage());
          }
          
          if(checkImageType(file)) {
             attchVO.setFileType("Y");
          }else {
             attchVO.setFileType("N");
          }
          
          List<BoardAttachVO> attachVOList = new ArrayList<BoardAttachVO>();
          attachVOList.add(attchVO);
          
          board.setAttachList(attachVOList);
      }
      
      //디비에 들어갈 때 사용할 구문이 된다.
      service.register(board);
      
      model.addAttribute("result", board.getBno()); 
      
      return "redirect:/board/list";
   
	}
	
	// 조회 처리 (수정 후)
	@RequestMapping(value="/read", method= RequestMethod.GET)
	public String read( @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("read");
		
		BoardVO board = new BoardVO();
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("board", service.read(cri.getBno()));
		model.addAttribute("file", service.getAttachList(cri.getBno()));
		
		return "Community/FreeBoardDetail";
	}
	
	// 조회 처리 (수정 후)
	@RequestMapping(value="/get", method= RequestMethod.GET)
	public String get( @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("read");
		
		BoardVO board = new BoardVO();
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("board", service.read(cri.getBno()));
		model.addAttribute("file", service.getAttachList(cri.getBno()));
		
		return "Community/FreeBoardDetail";
	}
	//수정 처리
	@RequestMapping("/update") 
	public String update(@ModelAttribute BoardVO board, @ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr) {
		
		log.info("update : " + board);
		
		if(service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	// 게시물 삭제 처리 (수정 후)
	@PostMapping("/delete")  
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		log.info("delete...." + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		deleteFiles(attachList);
		for(BoardAttachVO boardAttachVO : attachList) {
			//첨부파일 저장된거 DB에서 삭제~~ boardAttach
			service.deleteFile(boardAttachVO);
		}
		
		//board 테이블 삭제
		service.delete(bno);
		
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	// 첨부파일만 삭제하기.
	@GetMapping(value = "/deleteFile",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> deleteFile(@RequestParam("bno") Long bno){
		
		log.info("file delete : " + bno);
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		deleteFiles(attachList);
		
		for(BoardAttachVO boardAttachVO : attachList) {
			//첨부파일 저장된거 DB에서 삭제~~ boardAttach
			service.deleteFile(boardAttachVO);
		}
		
		return new ResponseEntity<String>("success.",HttpStatus.OK);
	}
	
	//Path를 이용한 물리적인 파일(upload폴더) 삭제처리
	//<// 삭제 처리 (수정 후)>위에 테이블에서 먼저 삭제한 이후에 물리적인 파일을 삭제해야 하므로 순서 중요시 해야 한다.
	private void deleteFiles(List<BoardAttachVO> attachList) {
			
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files.................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			
			try {
				Path file = Paths.get(attach.getUploadPath() + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				/*
				 * if(Files.probeContentType(file).startsWith("image")) { Path thumbNail =
				 * Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\
				 * s_" + attach.getUuid() + "_" + attach.getFileName());
				 * 
				 * Files.delete(thumbNail); }
				 */
			}catch(Exception e) {
				
				log.error("delete file error" + e.getMessage());
				
			}	//end catch
		});	//end forEach
	}
	
	//특정한 게시물 번호를 이용해 첨부파일과 관련된 데이터를 JSON형식으로 반환하도록 처리
		@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
			log.info("getAttachList" + bno);
			return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
		}

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
		String uploadFolder = "C:\\upload\\tmp\\"; //지정경로
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename()); // 실제 pc에 저장되어있는 이름
			log.info("Upload File Size: " + multipartFile.getSize()); // 업로드한 파일의 크기
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	//ajax를 이용한 파일 업로드
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	
	//년 월 일 폴더의 생성
	public String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//이미지 파일의 판단
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@PostMapping(value = "/uploadAjaxAction" , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		log.info("update ajax post..........");
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload\\tmp\\";
		
		String uploadFolderPath = getFolder();
		
		//make folder---------------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//make yyyy/MM/dd folder
		
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			log.info("only file name : " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			//餓λ쵎�궗 獄쎻뫗占썹몴占� 占쎌맄占쎈립 UUID占쎌읅占쎌뒠
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
		
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
			
				//check image type file
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
				
				//add to List
				list.add(attachDTO);
				
			}catch(Exception e) {
				e.printStackTrace();
			}//end catch
			
		}//end for
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	public void uploadFile(MultipartFile[] uploadFile) {
		
		log.info("update ajax post..........");
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload\\tmp\\";
		
		String uploadFolderPath = getFolder();
		
		//make folder---------------------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		//make yyyy/MM/dd folder
		
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			
			log.info("only file name : " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			//중복 방지를 위한 UUID적용
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
		
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
			
				//check image type file
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					
					thumbnail.close();
				}
				
				//add to List
				list.add(attachDTO);
				
			}catch(Exception e) {
				e.printStackTrace();
			}//end catch
			
		}//end for
		
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		log.info("fileName : " + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//첨부파일의 다운로드 형식 코드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody                                
	public ResponseEntity<Resource> downloadFile(String fileName){
		
		//log.info("download file : " + fileName);
		
		//해당 코드로 파일정보를 불러올 수있음.
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		
		log.info("resource : " + resource);
		
		String resourceName = resource.getFilename();
		
		//remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		try {            
			headers.add("Content-Disposition", "attachment; fileName=" + new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1"));
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		
	}
	
	
	//서버에서 첨부파일의 삭제 기능
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("deleteFile : " + fileName);
		
		File file;
		
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			if(type.equals("image")) {
				
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				
				log.info("largeFileName : " + largeFileName);
				
				file = new File(largeFileName);
				
				file.delete();
			}
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	//파일다운로드
	   @RequestMapping(value="/downloadFile")
	    public void downloadFile(@ModelAttribute BoardAttachVO boardAttachVO, HttpServletResponse response) throws Exception{
		   String fileName = boardAttachVO.getRealFileName();
		   String realFileName = fileName.replaceAll(boardAttachVO.getUuid(), "");
	      
	        byte[] fileByte = FileUtils.readFileToByteArray(new File("c:\\upload\\"+realFileName));
	        
	        //파일유형설정
	        response.setContentType("application/octet-stream"); 
	        //파일길이설정
	        response.setContentLength(fileByte.length);
	        //데이터형식/성향설정 (attachment: 첨부파일)
	        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(realFileName,"UTF-8")+"\";");
	        //내용물 인코딩방식설정
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        //버퍼의 출력스트림을 출력
	        response.getOutputStream().write(fileByte);
	        
	        //버퍼에 남아있는 출력스트림을 출력
	        response.getOutputStream().flush();
	        //출력스트림을 닫는다
	        response.getOutputStream().close();
	    }
	
	
}
