package com.study.service;

import com.study.anno.UserAnno;
import com.study.entity.User;
import org.springframework.stereotype.Service;

/**
 * @desc: description
 *
 * @author: Guangyue Huang
 * @date: 2019/3/26 21:56
 **/
@Service
public class UserService {

    @UserAnno
    public User updateById(User user, Long id){
        User user1 = new User();
        user1.setId(124L);
        user1.setUsername("Marry");
        user1.setPassword("111111");
        return user1;
    }


}
