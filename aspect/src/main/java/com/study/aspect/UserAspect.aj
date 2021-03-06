package com.study.aspect;

import com.study.entity.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Aspect
@Component
public aspect UserAspect {
    /**
     * 切点 1，匹配注解
     */
    @Pointcut("@annotation(com.study.anno.UserAnno)")
    public void matchAnno(){}

    /**
     * 切点 2，匹配类， UserService1 下所有方法
     */
    @Pointcut("within(com.study.service.UserService1)")
    public void matchClazz(){}

    /**
     * 切点 2，匹配包， com.study.service.impl 及其子包下的类的所有方法
     */
    @Pointcut("within(com.study.service.impl..*)")
    public void matchPackage(){}

    /**
     * 切点 2，匹配指定的方法，项目中所有方法名以 find 开头的方法
     */
    @Pointcut("execution(* find*(..))")
    public void testAspect1(){}

    /**
     * 切点 3，匹配继承接口，继承了 UserDao 接口的实现类所有的方法
     */
    @Pointcut("this(com.study.service.UserDao)")
    public void testAspect2(){}

    /**
     * 前置切片
     */
    @Before("matchAnno()")
    public void doBefore(JoinPoint point){
        // 获取目标方法参数
        Object[] args = point.getArgs();
        if (args != null && args.length > 0){
            // 参数为对象
            if (args[0] instanceof User){
                User user = (User) args[0];
                System.out.println("第一个参数：");
                System.out.println(user.toString());
            }
            // 基本数据类型参数
            if (args[1].getClass() == Long.class){
                System.out.println("第二个参数:" + args[1]);
            }
        }
    }

    /**
     * 后置切片
     */
    @After("matchClazz()")
    public void deAfter(JoinPoint point){
        System.out.println("@After...");
    }

    /**
     * 增强后置切片，可以获取到返回值所以叫增强
     */
    @AfterReturning(value = "testAspect1()", returning = "rvt")
    public void deAfterReturning(JoinPoint point, Object rvt){
        System.out.println("@AfterReturning...");
        System.out.println("返回值：" + rvt);
    }

    /**
     * 后置切片
     */
    @After("testAspect2()")
    public void deAfter2(JoinPoint point){
        System.out.println("@After...");
    }

    /**
     * 后置切片
     */
    @After("matchPackage()")
    public void deAfter3(JoinPoint point){
        System.out.println("@After...");
    }
    /**
     * 后置切片
     */
    @After("testAspect1()")
    public void deAfter4(JoinPoint point){
        System.out.println("@After...");
    }
}
