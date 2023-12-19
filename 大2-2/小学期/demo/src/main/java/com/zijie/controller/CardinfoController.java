package com.zijie.controller;

import com.zijie.entity.Cardinfo;
import com.zijie.service.CardinfoService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
@Controller
/**
 * (Cardinfo)表控制层
 *
 * @author makejava
 * @since 2023-07-18 14:40:24
 */

public class CardinfoController {
    /**
     * 服务对象
     */
    @Resource
    private CardinfoService cardinfoService;

    /**
     * 分页查询
     *
     * @param cardinfo 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @GetMapping("/cardinfo/get")
    public ResponseEntity<Page<Cardinfo>> queryByPage(Cardinfo cardinfo, PageRequest pageRequest) {
        return ResponseEntity.ok(this.cardinfoService.queryByPage(cardinfo, pageRequest));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("/cardinfo/get/{id}")
    public ResponseEntity<Cardinfo> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.cardinfoService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param cardinfo 实体
     * @return 新增结果
     */
    @PostMapping("/cardinfo/add")
    public ResponseEntity<Cardinfo> add(Cardinfo cardinfo) {
        return ResponseEntity.ok(this.cardinfoService.insert(cardinfo));
    }

    /**
     * 编辑数据
     *
     * @param cardinfo 实体
     * @return 编辑结果
     */
    @PostMapping("/cardinfo/edit")
    public ResponseEntity<Cardinfo> edit(Cardinfo cardinfo) {
        return ResponseEntity.ok(this.cardinfoService.update(cardinfo));
    }

    /**
     * 删除数据
     *
     * @param id 主键
     * @return 删除是否成功
     */
    @PostMapping("/cardinfo/delete")
    public ResponseEntity<Boolean> deleteById(Integer id) {
        return ResponseEntity.ok(this.cardinfoService.deleteById(id));
    }
}

