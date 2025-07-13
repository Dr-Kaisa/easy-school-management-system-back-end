package com.kaka.mapper;


import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DTO.OperateLogSelectResult;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OperationLogMapper {

    //插入日志数据
    @Insert("insert into operate_log (operate_emp_id, operate_time, class_name, method_name, method_params, return_value, cost_time) " +
            "values (#{operateEmpId}, #{operateTime}, #{className}, #{methodName}, #{methodParams}, #{returnValue}, #{costTime});")
    public void insert(OperateLogSelectResult log);

    @Select("select *,emp.name operateEmpName from operate_log ol left join emp on  ol.operate_emp_id=emp.id")
    List<OperateLogSelectResult> list();
}
