package com.kaka.pojo.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobReporter {
    private  String []jobList;
    private Integer [] dataList;
}
