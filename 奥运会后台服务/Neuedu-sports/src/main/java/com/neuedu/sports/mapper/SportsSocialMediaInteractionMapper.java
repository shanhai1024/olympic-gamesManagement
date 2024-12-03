package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsSocialMediaInteraction;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 媒体与公关-社交媒体互动Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsSocialMediaInteractionMapper extends BaseMapper<SportsSocialMediaInteraction>
{
    /**
     * 查询媒体与公关-社交媒体互动
     * 
     * @param id 媒体与公关-社交媒体互动主键
     * @return 媒体与公关-社交媒体互动
     */
    public SportsSocialMediaInteraction selectSportsSocialMediaInteractionById(Long id);

    /**
     * 查询媒体与公关-社交媒体互动列表
     * 
     * @param sportsSocialMediaInteraction 媒体与公关-社交媒体互动
     * @return 媒体与公关-社交媒体互动集合
     */
    public List<SportsSocialMediaInteraction> selectSportsSocialMediaInteractionList(SportsSocialMediaInteraction sportsSocialMediaInteraction);

    /**
     * 新增媒体与公关-社交媒体互动
     * 
     * @param sportsSocialMediaInteraction 媒体与公关-社交媒体互动
     * @return 结果
     */
    public int insertSportsSocialMediaInteraction(SportsSocialMediaInteraction sportsSocialMediaInteraction);

    /**
     * 修改媒体与公关-社交媒体互动
     * 
     * @param sportsSocialMediaInteraction 媒体与公关-社交媒体互动
     * @return 结果
     */
    public int updateSportsSocialMediaInteraction(SportsSocialMediaInteraction sportsSocialMediaInteraction);

    /**
     * 删除媒体与公关-社交媒体互动
     * 
     * @param id 媒体与公关-社交媒体互动主键
     * @return 结果
     */
    public int deleteSportsSocialMediaInteractionById(Long id);

    /**
     * 批量删除媒体与公关-社交媒体互动
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsSocialMediaInteractionByIds(Long[] ids);
}
