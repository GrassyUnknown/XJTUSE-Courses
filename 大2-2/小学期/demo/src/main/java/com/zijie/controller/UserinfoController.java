package com.zijie.controller;

import com.zijie.entity.Userinfo;
import com.zijie.service.UserinfoService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * (Userinfo)表控制层
 *
 * @author makejava
 * @since 2023-07-19 16:26:39
 */
@Controller
public class UserinfoController {
    /**
     * 服务对象
     */
    @Resource
    private UserinfoService userinfoService;

    /**
     * 分页查询
     *
     * @param userinfo 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping
    public ResponseEntity<Page<Userinfo>> queryByPage(Userinfo userinfo, PageRequest pageRequest) {
        return ResponseEntity.ok(this.userinfoService.queryByPage(userinfo, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("userinfo/get/{id}")
    public ResponseEntity<Userinfo> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.userinfoService.queryById(id));
    }

    @GetMapping("login")
    public ResponseEntity<Userinfo> login(String username, String password) {
        System.out.println("sgfaghsfgjsdgjsgdj");
        return ResponseEntity.ok(this.userinfoService.login(username, password));
    }

    /**
     * 新增数据
     *
     * @param userinfo 实体
     * @return 新增结果
     */
    @PostMapping
    public ResponseEntity<Userinfo> add(Userinfo userinfo) {
        return ResponseEntity.ok(this.userinfoService.insert(userinfo));
    }

    /**
     * 编辑数据
     *
     * @param userinfo 实体
     * @return 编辑结果
     */
    @PutMapping
    public ResponseEntity<Userinfo> edit(Userinfo userinfo) {
        return ResponseEntity.ok(this.userinfoService.update(userinfo));
    }

    /**
     * 删除数据
     *
     * @param id 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public ResponseEntity<Boolean> deleteById(Integer id) {
        return ResponseEntity.ok(this.userinfoService.deleteById(id));
    }

}

