package com.kaka.pojo.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmpPageParm {
    private String name;
    private Integer  gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate begin;
    @DateTimeFormat (pattern = "yyyy-MM-dd")
    private LocalDate end;
    private Integer page=1;
    private Integer pageSize=10;
}
