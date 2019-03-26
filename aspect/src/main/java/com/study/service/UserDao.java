package com.study.service;

import com.study.entity.User;

/**
 * @desc: description
 *
 * @author: Guangyue Huang
 * @date: 2019/3/26 22:15
 **/
public interface UserDao {

    User getById();

    int deleteById(Long id);
}
