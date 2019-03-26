## spring AOP 切片
> * 依赖
```java
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-aop</artifactId>
</dependency>
```
> * 切面类
    
   `execution()` 表达式可以完成匹配类、匹配方法、匹配包等，是很强大的表达式，这里只举例了匹配方法；
   
   在增强型后置通知中可以更改具体方法的返回值
   
   默认都是同步的，即完整流程是：
   ```flow
   st=>start: 前置通知
   st1=>operation: 方法执行
   st2=>end: 后置通知
   
   st->st1->st2
   ```
```java
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
```