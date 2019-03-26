package com.study.service;

import com.study.entity.User;
import org.springframework.stereotype.Service;

/**
 * @desc: description
 *
 * @author: Guangyue Huang
 * @date: 2019/3/26 22:16
 **/
@Service
public class UserService3 implements UserDao {

    @Override
    public User getById() {
        return null;
    }

    @Override
    public int deleteById(Long id) {
        return 0;
    }
}
