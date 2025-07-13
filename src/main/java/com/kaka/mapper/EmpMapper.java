package com.kaka.mapper;

import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DTO.EmpPageParm;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface EmpMapper {
//    //查询总记录数
//    @Select("select count(*) from emp e left join dept d on e.dept_id = d.id")
//    Long count();
//
//    //分页查询
//    @Select("select e.*,d.name dept_name from emp e left join dept d on e.dept_id = d.id order by update_time desc limit #{start}, #{pageSize}")
//    List<Emp> list(Integer start, Integer pageSize);

    //使用pageHelper之后就方便多了
//    @Select("select e.*,d.name dept_name from emp e left join dept d on e.dept_id = d.id order by update_time desc")
    //根据条件查询全部员工
    List<Emp> list(EmpPageParm parm);

    //添加员工
    @Options(useGeneratedKeys = true, keyProperty = "id") //拿到本次插入生成的id并自动设置给emp对象
    @Insert("insert into emp(username, name, gender, phone, job, salary, image, entry_date, dept_id, create_time, update_time) " +
            "values(#{username}, #{name}, #{gender}, #{phone}, #{job}, #{salary}, " +
            "#{image}, #{entryDate}, #{deptId}, #{createTime}, #{updateTime})")
    void insert(Emp emp);



    //批量删除员工
    void deleteById(Integer[] ids);


    //根据id查询员工
    Emp getById(Integer id);

    void update(Emp emp);
}
