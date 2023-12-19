package com.zijie.service.impl;

import com.zijie.entity.Cardinfo;
import com.zijie.dao.CardinfoDao;
import com.zijie.service.CardinfoService;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import javax.annotation.Resource;

/**
 * (Cardinfo)表服务实现类
 *
 * @author makejava
 * @since 2023-07-18 14:40:28
 */
@Service("cardinfoService")
public class CardinfoServiceImpl implements CardinfoService {
    @Resource
    private CardinfoDao cardinfoDao;

    /**
     * 通过ID查询单条数据
     *
     * @param cardid 主键
     * @return 实例对象
     */
    @Override
    public Cardinfo queryById(Integer cardid) {
        return this.cardinfoDao.queryById(cardid);
    }

    /**
     * 分页查询
     *
     * @param cardinfo 筛选条件
     * @param pageRequest      分页对象
     * @return 查询结果
     */
    @Override
    public Page<Cardinfo> queryByPage(Cardinfo cardinfo, PageRequest pageRequest) {
        long total = this.cardinfoDao.count(cardinfo);
        return new PageImpl<>(this.cardinfoDao.queryAllByLimit(cardinfo, pageRequest), pageRequest, total);
    }

    /**
     * 新增数据
     *
     * @param cardinfo 实例对象
     * @return 实例对象
     */
    @Override
    public Cardinfo insert(Cardinfo cardinfo) {
        this.cardinfoDao.insert(cardinfo);
        return cardinfo;
    }

    /**
     * 修改数据
     *
     * @param cardinfo 实例对象
     * @return 实例对象
     */
    @Override
    public Cardinfo update(Cardinfo cardinfo) {
        this.cardinfoDao.update(cardinfo);
        return this.queryById(cardinfo.getCardid());
    }

    /**
     * 通过主键删除数据
     *
     * @param cardid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer cardid) {
        return this.cardinfoDao.deleteById(cardid) > 0;
    }
}
