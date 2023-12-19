package com.zijie.service;

import com.zijie.entity.Userinfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

/**
 * (Userinfo)表服务接口
 *
 * @author makejava
 * @since 2023-07-19 16:26:39
 */
public interface UserinfoService {

    /**
     * 通过ID查询单条数据
     *
     * @param uid 主键
     * @return 实例对象
     */
    Userinfo queryById(Integer uid);

    /**
     * 分页查询
     *
     * @param userinfo 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Userinfo> queryByPage(Userinfo userinfo, PageRequest pageRequest);

    /**
     * 新增数据
     *
     * @param userinfo 实例对象
     * @return 实例对象
     */
    Userinfo insert(Userinfo userinfo);

    /**
     * 修改数据
     *
     * @param userinfo 实例对象
     * @return 实例对象
     */
    Userinfo update(Userinfo userinfo);

    /**
     * 通过主键删除数据
     *
     * @param uid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer uid);

    Userinfo login(String username, String password);
}
