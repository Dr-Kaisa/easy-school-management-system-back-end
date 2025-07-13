package com.kaka.service;

import com.kaka.pojo.DO.Dept;

import java.util.List;

public interface DeptService {

    List<Dept> findAll();

    void delete(Integer id);

    void add(Dept dept);

    Dept get(Integer id);

    void update(Dept dept);
}
