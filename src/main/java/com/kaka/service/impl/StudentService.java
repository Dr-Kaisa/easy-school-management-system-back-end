package com.kaka.service.impl;



import com.kaka.pojo.DO.ClazzCountOption;
import com.kaka.pojo.DO.Student;
import com.kaka.pojo.VO.EmpPageResult;

import java.util.List;
import java.util.Map;

public interface StudentService {

    /**
     * 添加学生信息
     */
    void save(Student student);

    /**
     * 条件分页查询
     */
    EmpPageResult page(String name, Integer degree, Integer clazzId, Integer page, Integer pageSize);

    /**
     * 根据ID查询学生信息
     */
    Student getInfo(Integer id);

    /**
     * 修改学生信息
     */
    void update(Student student);

    /**
     * 删除学生信息
     */
    void delete(List<Integer> ids);

    /**
     * 违纪处理
     */
    void violationHandle(Integer id, Integer score);

    /**
     * 统计学历人数
     */
    List<Map> getStudentDegreeData();

    /**
     * 统计班级人数
     */
    ClazzCountOption getStudentCountData();
}
