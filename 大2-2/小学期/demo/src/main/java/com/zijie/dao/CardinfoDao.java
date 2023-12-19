package com.zijie.dao;

import com.zijie.entity.Cardinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.List;

@Mapper
/**
 * (Cardinfo)表数据库访问层
 *
 * @author makejava
 * @since 2023-07-18 14:44:59
 */
public interface CardinfoDao {

    /**
     * 通过ID查询单条数据
     *
     * @param cardid 主键
     * @return 实例对象
     */
    Cardinfo queryById(Integer cardid);

    /**
     * 查询指定行数据
     *
     * @param cardinfo 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<Cardinfo> queryAllByLimit(Cardinfo cardinfo, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param cardinfo 查询条件
     * @return 总行数
     */
    long count(Cardinfo cardinfo);

    /**
     * 新增数据
     *
     * @param cardinfo 实例对象
     * @return 影响行数
     */
    int insert(Cardinfo cardinfo);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Cardinfo> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<Cardinfo> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Cardinfo> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<Cardinfo> entities);

    /**
     * 修改数据
     *
     * @param cardinfo 实例对象
     * @return 影响行数
     */
    int update(Cardinfo cardinfo);

    /**
     * 通过主键删除数据
     *
     * @param cardid 主键
     * @return 影响行数
     */
    int deleteById(Integer cardid);

}

