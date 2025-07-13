package com.kaka.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kaka.pojo.DO.Emp;
import com.kaka.pojo.DO.EmpExpr;
import com.kaka.pojo.DO.EmpLog;
import com.kaka.pojo.DTO.EmpPageParm;
import com.kaka.pojo.VO.PageResult;
import com.kaka.mapper.EmpExprMapper;
import com.kaka.mapper.EmpMapper;
import com.kaka.service.EmpLogService;
import com.kaka.service.EmpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    EmpMapper empMapper;
    @Autowired
    EmpExprMapper empExprMapper;
    @Autowired
    EmpLogService empLogService;
    @Override
    public PageResult<Emp> page(EmpPageParm parm) {
//        Long total = empMapper.count();
//        Integer start = (pageNum-1)*pageSize;
//        List< Emp> rows =empMapper.list(start, pageSize);
        PageHelper.startPage(parm.getPage(), parm.getPageSize());
        //执行查询，PageHelper对其进行了处理
        List<Emp> empList = empMapper.list(parm);
        //解析并封装
        Page page=(Page) empList;
        return new PageResult<>(page.getTotal(), page.getResult());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void add(Emp emp) {
        try {
            //保存员工基本信息
            emp.setCreateTime(LocalDateTime.now());
            emp.setUpdateTime(LocalDateTime.now());
            empMapper.insert(emp);
            log.info("现在员工信息:{}", emp);

            //保存员工工作经历
            List<EmpExpr> empExprList = emp.getExprList();
            if(!CollectionUtils.isEmpty(empExprList)){
                //遍历集合，为每个员工工作经历设置员工id
                for (EmpExpr empExpr : empExprList) {
                    empExpr.setEmpId(emp.getId());
                }
                empExprMapper.insertBatch(empExprList);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            //记录操作日志
            EmpLog empLog = new EmpLog(null, LocalDateTime.now(), "添加员工"+emp);
            empLogService.insertLog(empLog);
        }

    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(Integer[] ids) {
        empMapper.deleteById(ids);
        empExprMapper.deleteByEmpId(ids);
    }

    //通过id获取员工信息
    @Override
    public Emp getById(Integer id) {
        Emp emp = empMapper.getById(id);
        return emp;
    }

    //修改员工信息
    //，删除emp_expr表中的记录，再将工作经历添加进emp_expr表
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void update(Emp emp) {
        //更新emp表
        empMapper.update(emp);
        //先根据empId删除对应的工作经历
        empExprMapper.deleteByEmpId(new Integer[]{emp.getId()});
        //再添加新的工作经历
        for(EmpExpr empExpr:emp.getExprList()){
            empExpr.setEmpId(emp.getId());
        }
        empExprMapper.insertBatch(emp.getExprList());
    }

}
