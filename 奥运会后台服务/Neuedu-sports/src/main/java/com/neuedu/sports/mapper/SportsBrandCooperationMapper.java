package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsBrandCooperation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 媒体与公关-品牌合作Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsBrandCooperationMapper extends BaseMapper<SportsBrandCooperation>
{
    /**
     * 查询媒体与公关-品牌合作
     * 
     * @param id 媒体与公关-品牌合作主键
     * @return 媒体与公关-品牌合作
     */
    public SportsBrandCooperation selectSportsBrandCooperationById(Long id);

    /**
     * 查询媒体与公关-品牌合作列表
     * 
     * @param sportsBrandCooperation 媒体与公关-品牌合作
     * @return 媒体与公关-品牌合作集合
     */
    public List<SportsBrandCooperation> selectSportsBrandCooperationList(SportsBrandCooperation sportsBrandCooperation);

    /**
     * 新增媒体与公关-品牌合作
     * 
     * @param sportsBrandCooperation 媒体与公关-品牌合作
     * @return 结果
     */
    public int insertSportsBrandCooperation(SportsBrandCooperation sportsBrandCooperation);

    /**
     * 修改媒体与公关-品牌合作
     * 
     * @param sportsBrandCooperation 媒体与公关-品牌合作
     * @return 结果
     */
    public int updateSportsBrandCooperation(SportsBrandCooperation sportsBrandCooperation);

    /**
     * 删除媒体与公关-品牌合作
     * 
     * @param id 媒体与公关-品牌合作主键
     * @return 结果
     */
    public int deleteSportsBrandCooperationById(Long id);

    /**
     * 批量删除媒体与公关-品牌合作
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsBrandCooperationByIds(Long[] ids);
}
