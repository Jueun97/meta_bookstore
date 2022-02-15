package com.meta.admin.controller;

import com.meta.book.vo.BookVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Slf4j
@Controller
public class UploadTest {

    private String fileDownloadDirectory = "C:\\Users\\user\\Desktop\\metabook\\meta-bookdstore\\src\\main\\resources\\images\\";

    @GetMapping("/upload")
    public String newFile() {
        return "upload-form";
    }

    @PostMapping("/upload")
    public String saveFile(@RequestParam(value = "filename", required = false) MultipartFile file ,
                           HttpServletRequest request, @ModelAttribute BookVO vo) throws IOException {
        log.info("request = {}", request);
        log.info("multipartFile = {}", file);
        log.info("BookVO = {}", vo);

        if (!file.isEmpty()) {
            String downloadPath = fileDownloadDirectory + file.getOriginalFilename();
            log.info("파일 저장 경로 = {}", downloadPath);
            file.transferTo(new File(downloadPath));
        }

        return "/admin/test";
    }
}
