package com.zijie.service;

import com.zijie.entity.Cardinfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

/**
 * (Cardinfo)表服务接口
 *
 * @author makejava
 * @since 2023-07-18 14:40:25
 */
public interface CardinfoService {

    /**
     * 通过ID查询单条数据
     *
     * @param cardid 主键
     * @return 实例对象
     */
    Cardinfo queryById(Integer cardid);

    /**
     * 分页查询
     *
     * @param cardinfo 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    Page<Cardinfo> queryByPage(Cardinfo cardinfo, PageRequest pageRequest);

    /**
     * 新增数据
     *
     * @param cardinfo 实例对象
     * @return 实例对象
     */
    Cardinfo insert(Cardinfo cardinfo);

    /**
     * 修改数据
     *
     * @param cardinfo 实例对象
     * @return 实例对象
     */
    Cardinfo update(Cardinfo cardinfo);

    /**
     * 通过主键删除数据
     *
     * @param cardid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer cardid);

}
