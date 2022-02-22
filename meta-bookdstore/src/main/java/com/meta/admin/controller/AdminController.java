package com.meta.admin.controller;

import com.meta.book.service.BookService;
import com.meta.book.vo.BookVO;
import com.meta.member.dto.MemberUpdateAdminDto;
import com.meta.member.service.MemberService;
import com.meta.member.vo.MemberVO;
import com.meta.order.service.OrderService;
import com.meta.order.vo.OrderVO;
import com.meta.stock.service.StockService;
import com.meta.stock.vo.StockVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private BookService bookService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private StockService stockService;

	//파일 경로.
	@Value("${file.path}")
	private String fileDownloadDirectory ;

	//썸네일 경로.
	@Value("${thumb.path}")
	private String thumbnailDirectory;

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

		return "/admin/book/bookList";
	}

	@GetMapping("bookInsertForm")

	public String bookInsertForm(Model model){
		System.out.println("bookInsertForm");
		model.addAttribute("cateInfo", bookService.cateList());

		return "admin/book/bookInsertForm";
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
						   HttpServletRequest request, @ModelAttribute BookVO vo, @ModelAttribute StockVO stockVO) throws IOException {
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
		}else{
			log.info("선택된 파일이 없는 경우!!!");
			vo.setImage(fileDownloadDirectory + "base_book");
			vo.setTh_image(fileDownloadDirectory + "base_book");
		}
		bookService.insert(vo);
		stockService.insertStock(stockVO);

		return "redirect:/admin/book";
	}

	@PostMapping("bookUpdate")
	public String bookUpdate(@RequestParam(value = "filename", required = false) MultipartFile file ,
							 HttpServletRequest request, @ModelAttribute BookVO vo, @ModelAttribute StockVO stockVO) throws IOException {
		System.out.println("bookUpdate");
		log.info("request = {}", request);
		log.info("multipartFile = {}", file);
		log.info("BookVO = {}", vo);
		log.info("StockVO = {}", stockVO);

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
		stockService.updateStock(stockVO);

		return "redirect:/admin/book";
	}

	@GetMapping("bookDetail")
	public String bookDetail(@ModelAttribute BookVO vo, Model model){
		System.out.println("bookDetail");
		System.out.println(vo.getBook_no());
		model.addAttribute("bookInfo", bookService.detailBookInfo(vo.getBook_no()));
		model.addAttribute("cateInfo", bookService.cateList());
		System.out.println(bookService.detailBookInfo(vo.getBook_no()));

		return "admin/book/bookInfoDetail";
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

	/////////////////////////////////////////////////////////////////////////////
	// Member >>>>>>>
	/////////////////////////////////////////////////////////////////////////////
	@GetMapping("member")
	public String memberView(Model model){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");
		model.addAttribute("memberInfo", memberService.memberList());
		return "/admin/member/memberList";
	}

	@GetMapping("memberUpdate")
	public String memberUpdate(@ModelAttribute MemberVO vo, Model model){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");
		model.addAttribute("memberInfo", memberService.memberDetailInfo(vo.getM_no()));
		model.addAttribute("memberUpdateAdminDto", new MemberUpdateAdminDto());

		return "/admin/member/memberUpdateForm";
	}

	//회원 정보 수정 요청
	@PostMapping("memberUpdate")
	public String update(Model model, @ModelAttribute("memberUpdateAdminDto") @Valid MemberUpdateAdminDto memberUpdateAdminDto,
						  BindingResult bindingResult, RedirectAttributes rttr) {
		log.info("update().dto : " + memberUpdateAdminDto);

		int res = memberService.memberUpdate(memberUpdateAdminDto);
		log.info("회원정보 수정이" + res + "건 완료되었습니다.");
		return "redirect:/admin/member";
	}

	//회원 정보 삭제
	@GetMapping("memberDelete")
	public String memberDelete(@ModelAttribute MemberVO vo){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");
		int check = memberService.memberDelete(vo.getM_no());

		log.info("회원 삭제가 " + check + "건 완료되었습니다.");

		return "redirect:/admin/member";
	}

	//////////////////////////////////////////////////////////////////////
	//>> Order 관리
	//////////////////////////////////////////////////////////////////////

	//주문 리스트 조회
	@GetMapping("order")
	public String orderList(Model model){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");

		model.addAttribute("orderInfo", orderService.orderList());

		return "/admin/order/orderList";
	}

	//주문 삭제
	@GetMapping("orderDelete")
	public String orderDelete(String order_no){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");

		int count = orderService.deleteOrder(order_no);

		return "redirect:/admin/order";
	}

	//주문 정보 관리
	@GetMapping("orderUpdate")
	public String orderUpdate(String order_no, Model model){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");

		model.addAttribute("orderInfo", orderService.getOneOrderInfo(order_no));
		model.addAttribute("orderItems", orderService.getOrderItems(order_no));
		model.addAttribute("orderStatus", orderService.getOrderStatusInfo());

		return "/admin/order/orderUpdate";

	}

	//주문 정보 관리 처리
	@PostMapping("orderUpdate")
	public String update(@ModelAttribute OrderVO orderVo){
		System.out.println(">>> "+this.getClass()+ " 호출됨!");
		log.info(String.valueOf(orderVo));
		int count = orderService.updateOrderAdmin(orderVo);

		log.info("주문 정보 변경이 " + count + "건 처리되었습니다.");
		return "redirect:/admin/order";
	}

}
