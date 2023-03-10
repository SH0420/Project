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
public class BoardController {  //???????????? ??????
	
	private BoardService service;  // ?????? ????????? ?????? ??????
	
	//@RequestMapping(value="/list", method=RequestMethod.POST)  // ?????? ????????? ???????????? ??????
	@RequestMapping("/list")
	public String list(Model model, @ModelAttribute BoardVO board) {
		log.info("list");
		
		//
		int total = service.getListCount(board);
		
		model.addAttribute("pageMaker", new PageDTO(board, total));
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("list", service.getList(board));
		model.addAttribute("board", board); //?????? ????????? ?????? ??????
		log.info(model);  //???????????? ??????????????????
		
		return "Community/FreeBoardList"; //????????????/??????????????????????????? ??????
	}
	
	//??? ???????????? ?????? ???????????? ????????? ??????
	@RequestMapping("/register")
	public String register(Model model, @ModelAttribute BoardVO board, @ModelAttribute ReplyVO reply) {
		log.info("list");

		//
		model.addAttribute("cateList", service.getCategoryList(board));
		
		return "Community/FreeBoardWrite";
	}
	
	//??? ???????????? ???????????? ??????
	@RequestMapping("/registerProc")             //????????? ?????? 
   public String registerProc(Model model, MultipartHttpServletRequest mRequest, @ModelAttribute BoardVO board, MultipartHttpServletRequest mpRequest) {  // ????????? ?????? BoardVO?????? ?????? ???????????? ????????? ??????
      // RedirectAttributes??? addFlashAttribute -> ?????? ????????? ???????????? ???????????? ???????????? ?????? ?????? 
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
          
          //???????????? ????????? ????????????.
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
      
      //????????? ????????? ??? ????????? ????????? ??????.
      service.register(board);
      
      model.addAttribute("result", board.getBno()); 
      
      return "redirect:/board/list";
   
	}
	
	// ?????? ?????? (?????? ???)
	@RequestMapping(value="/read", method= RequestMethod.GET)
	public String read( @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("read");
		
		BoardVO board = new BoardVO();
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("board", service.read(cri.getBno()));
		model.addAttribute("file", service.getAttachList(cri.getBno()));
		
		return "Community/FreeBoardDetail";
	}
	
	// ?????? ?????? (?????? ???)
	@RequestMapping(value="/get", method= RequestMethod.GET)
	public String get( @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("read");
		
		BoardVO board = new BoardVO();
		model.addAttribute("cateList", service.getCategoryList(board));
		model.addAttribute("board", service.read(cri.getBno()));
		model.addAttribute("file", service.getAttachList(cri.getBno()));
		
		return "Community/FreeBoardDetail";
	}
	//?????? ??????
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
	
	// ????????? ?????? ?????? (?????? ???)
	@PostMapping("/delete")  
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		log.info("delete...." + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		deleteFiles(attachList);
		for(BoardAttachVO boardAttachVO : attachList) {
			//???????????? ???????????? DB?????? ??????~~ boardAttach
			service.deleteFile(boardAttachVO);
		}
		
		//board ????????? ??????
		service.delete(bno);
		
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	// ??????????????? ????????????.
	@GetMapping(value = "/deleteFile",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> deleteFile(@RequestParam("bno") Long bno){
		
		log.info("file delete : " + bno);
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		deleteFiles(attachList);
		
		for(BoardAttachVO boardAttachVO : attachList) {
			//???????????? ???????????? DB?????? ??????~~ boardAttach
			service.deleteFile(boardAttachVO);
		}
		
		return new ResponseEntity<String>("success.",HttpStatus.OK);
	}
	
	//Path??? ????????? ???????????? ??????(upload??????) ????????????
	//<// ?????? ?????? (?????? ???)>?????? ??????????????? ?????? ????????? ????????? ???????????? ????????? ???????????? ????????? ?????? ????????? ?????? ??????.
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
	
	//????????? ????????? ????????? ????????? ??????????????? ????????? ???????????? JSON???????????? ??????????????? ??????
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
		
		String uploadFolder = "C:\\upload\\tmp\\"; //????????????
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename()); // ?????? pc??? ?????????????????? ??????
			log.info("Upload File Size: " + multipartFile.getSize()); // ???????????? ????????? ??????
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}
	
	//ajax??? ????????? ?????? ?????????
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		
		log.info("upload ajax");
	}
	
	//??? ??? ??? ????????? ??????
	public String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//????????? ????????? ??????
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
			
			//?????????????? ???????????????????????? ?????????????????? UUID??????????????????
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
			
			//?????? ????????? ?????? UUID??????
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
	
	//??????????????? ???????????? ?????? ??????
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody                                
	public ResponseEntity<Resource> downloadFile(String fileName){
		
		//log.info("download file : " + fileName);
		
		//?????? ????????? ??????????????? ????????? ?????????.
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
	
	
	//???????????? ??????????????? ?????? ??????
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
	
	//??????????????????
	   @RequestMapping(value="/downloadFile")
	    public void downloadFile(@ModelAttribute BoardAttachVO boardAttachVO, HttpServletResponse response) throws Exception{
		   String fileName = boardAttachVO.getRealFileName();
		   String realFileName = fileName.replaceAll(boardAttachVO.getUuid(), "");
	      
	        byte[] fileByte = FileUtils.readFileToByteArray(new File("c:\\upload\\"+realFileName));
	        
	        //??????????????????
	        response.setContentType("application/octet-stream"); 
	        //??????????????????
	        response.setContentLength(fileByte.length);
	        //???????????????/???????????? (attachment: ????????????)
	        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(realFileName,"UTF-8")+"\";");
	        //????????? ?????????????????????
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        //????????? ?????????????????? ??????
	        response.getOutputStream().write(fileByte);
	        
	        //????????? ???????????? ?????????????????? ??????
	        response.getOutputStream().flush();
	        //?????????????????? ?????????
	        response.getOutputStream().close();
	    }
	
	
}
