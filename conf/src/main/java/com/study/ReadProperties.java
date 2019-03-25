package com.study;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @desc: 读取配置文件测试
 *
 * @author: Guangyue Huang
 * @date: 2019/3/25 21:38
 **/
@Component
@PropertySource("classpath:prop.properties")
public class ReadProperties {

    @Value("${web.file.path}")
    private String path;

    public void getPropertiesValue(){
        System.out.println(path);
    }
}
