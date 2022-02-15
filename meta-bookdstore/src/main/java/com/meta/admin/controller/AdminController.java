package com.meta.admin.controller;

import com.meta.book.service.BookService;
import com.meta.book.vo.BookVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private BookService bookService;

	//파일 경로.
	@Value("${file.path}")
	private String fileDownloadDirectory ;

	//썸네일 경로.
	@Value("${thumb.path}")
	private String thumbnailDirectory;
	//= "C:\\Users\\user\\Desktop\\metabook\\meta-bookdstore\\src\\main\\resources\\th_images\\"

	//추후 admin의 메인 페이지로 사용할 예정. 아직 페이지 구성 미완료.
	@RequestMapping("")
	public String index(Model model) {
		return "/admin/main";
	}

	//추후 admin의 main 페이지로 사용.
	@GetMapping("main")
	public String adminMainView(Model model) {
		System.out.println("adminTestView");
		return "/admin/main";
	}

	//추후 admin의 책관리 페이지로 사용.
	@GetMapping("book")
	public String bookView(Model model) {
		System.out.println("adminTestView");
		model.addAttribute("bookdata", bookService.list());

		return "/admin/book";
	}

	@GetMapping("bookInsertForm")

	public String bookInsertForm(Model model){
		System.out.println("bookInsertForm");

		return "/admin/bookInsertForm";
	}

	//이미지 업로드 테스트
	@GetMapping("test")
	public String test(Model model){
		System.out.println("test");
		model.addAttribute("testData", bookService.detailBookInfo(150L));

		return "/admin/test";
	}

	@PostMapping("bookInsert")
	public String saveFile(@RequestParam(value = "filename", required = false) MultipartFile file ,
						   HttpServletRequest request, @ModelAttribute BookVO vo) throws IOException {
		log.info("request = {}", request);
		log.info("multipartFile = {}", file);
		log.info("BookVO = {}", vo);

		String uploadFileName = file.getOriginalFilename();
		//썸네일
		String thumbnailFileName = "";

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		//썸네일
		thumbnailFileName = "th_" + uploadFileName;

		if (!file.isEmpty()) {
			String downloadPath = fileDownloadDirectory + uploadFileName;
			log.info("파일 저장 경로 = {}", downloadPath);
			file.transferTo(new File(downloadPath));

			//원본 파일 저장 후 썸네일 파일 저장.
			Thumbnails.of(new File(downloadPath))
					.size(190, 150)
					.outputFormat("png")
					.toFile(thumbnailDirectory + thumbnailFileName);
			vo.setImage(uploadFileName);
			vo.setTh_image(thumbnailFileName);
			bookService.insert(vo);
		}else{
			log.info("선택된 파일이 없는 경우!!!");
			vo.setImage(fileDownloadDirectory + "base_book");
			vo.setTh_image(fileDownloadDirectory + "base_book");
			bookService.insert(vo);
		}

		return "redirect:/admin/book";
	}

	@PostMapping("bookUpdate")
	public String bookUpdate(@RequestParam(value = "filename", required = false) MultipartFile file ,
							 HttpServletRequest request, @ModelAttribute BookVO vo) throws IOException {
		System.out.println("bookUpdate");
		log.info("request = {}", request);
		log.info("multipartFile = {}", file);
		log.info("BookVO = {}", vo);

		//지울이름!
		String imageName = vo.getImage();
		String thumbName = vo.getTh_image();
		System.out.println("<><><><><>><><><><" + vo.getTh_image());

		//새로수정할 이미지 이름
		String uploadFileName = file.getOriginalFilename();
		//썸네일
		String thumbnailFileName = "";

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		//썸네일
		thumbnailFileName = "th_" + uploadFileName;

		if (!file.isEmpty()) {
			//사진 수정 시 업로드할 경로
			String downloadPath = fileDownloadDirectory + uploadFileName;

			//사진 수정 시 삭제할 경로. 썸네일화 시키면서 outputFormat에 의해 뒤에 확장자가 붙어서 이름 잘 확인!!
			String deletePath = fileDownloadDirectory + imageName;
			String thumbDelPath = thumbnailDirectory + thumbName + ".png";

			log.info("파일 저장 경로 = {}", downloadPath);
			file.transferTo(new File(downloadPath));

			//원본 파일 저장 후 썸네일 파일 저장.
			Thumbnails.of(new File(downloadPath))
					.size(190, 150)
					.outputFormat("png")
					.toFile(thumbnailDirectory + thumbnailFileName);

			//기존 이미지 삭제
			File delFile = new File(deletePath);
			if( delFile.exists() ){
				if(delFile.delete()){
					System.out.println("delFile파일삭제 성공");
				}else{
					System.out.println("delFile파일삭제 실패");
				}
			}else {
				System.out.println("파일이 존재하지 않습니다.1");
			}

			File thumbDelFile = new File(thumbDelPath);
			if( thumbDelFile.exists() ){
				if(thumbDelFile.delete()){
					System.out.println("thumbDelFile파일삭제 성공");
				}else{
					System.out.println("thumbDelFile파일삭제 실패");
				}
			}else {
				System.out.println("파일이 존재하지 않습니다.2");
			}

			vo.setImage(uploadFileName);
			vo.setTh_image(thumbnailFileName);
		}else{
			log.info("선택된 파일이 없는 경우!!!");
		}

		bookService.updateBookInfo(vo);

		return "/admin/main";
	}

	@GetMapping("bookDetail")
	public String bookDetail(@ModelAttribute BookVO vo, Model model){
		System.out.println("bookDetail");
		System.out.println(vo.getBook_no());
		model.addAttribute("bookInfo", bookService.detailBookInfo(vo.getBook_no()));
		System.out.println(bookService.detailBookInfo(vo.getBook_no()));

		return "/admin/bookInfoDetail";
	}

	//책의 정보의 삭제
	@GetMapping("bookDelete")
	public String bookDelete(@ModelAttribute BookVO vo){
		//Get방식의 url mapping을 통해서 삭제할 책의 정보 번호를
		//받아와 @ModelAttribute를 통해 vo로 값을 받는다.
		System.out.println(">>> "+this.getClass()+ " 호출됨!");
		System.out.println(vo.getBook_no());

		//받아온 책의 no를 BookService의 delete함수로 전달.
		BookVO info = bookService.detailBookInfo(vo.getBook_no());

		String imageName = info.getImage();
		String thumbName = info.getTh_image();

		imageName = fileDownloadDirectory + imageName;
		thumbName = thumbnailDirectory + thumbName + ".png";

		//원본 이미지 삭제
		File delFile = new File(imageName);
		if( delFile.exists() ){
			if(delFile.delete()){
				System.out.println("delFile파일삭제 성공");
			}else{
				System.out.println("delFile파일삭제 실패");
			}
		}else {
			System.out.println("파일이 존재하지 않습니다.1");
		}

		//썸네일 이미지 삭제
		File delThumbFile = new File(thumbName);
		if( delThumbFile.exists() ){
			if(delThumbFile.delete()){
				System.out.println("delFile파일삭제 성공");
			}else{
				System.out.println("delFile파일삭제 실패");
			}
		}else {
			System.out.println("파일이 존재하지 않습니다.1");
		}

		//=> 위의 코드는 추후 리팩토링 필요할 듯.

		bookService.delete(vo.getBook_no());

		//과정이 끝난 후에는 책관리 페이지로 다시 redirecting한다.
		return "redirect:/admin/book";
	}
}
