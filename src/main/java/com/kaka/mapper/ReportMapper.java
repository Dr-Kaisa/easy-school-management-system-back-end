package com.kaka.mapper;

import com.kaka.pojo.DTO.JobCountDTO;
import com.kaka.pojo.VO.GenderCountVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMapper {


    List<JobCountDTO> getCountList();

    List<GenderCountVO> getGenderCount();
}
