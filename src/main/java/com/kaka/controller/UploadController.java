package com.kaka.controller;

import com.kaka.pojo.DO.Result;
import com.kaka.Utils.AliyunOSSOperator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@Slf4j
public class UploadController {
    @Autowired
    AliyunOSSOperator aliyunOSSOperator;
    @PostMapping("/upload")
    public Result upload(MultipartFile  file) throws Exception {

        log.info("上传文件名{}", file.getOriginalFilename());
//        //获取原始文件名称
//        String originalFilename = file.getOriginalFilename();
//        //获取文件后缀
//        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
//        // 生成新的UUID文件名
//        String newFileName = UUID.randomUUID().toString() + suffix;
//        //保存文件
//        try {
//            file.transferTo(new File("D:/" + newFileName));
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        //url

        String url = aliyunOSSOperator.upload(file.getBytes(), file.getOriginalFilename());
        log.info("上传文件{}", url);
        return Result.success(url);
    }
}
