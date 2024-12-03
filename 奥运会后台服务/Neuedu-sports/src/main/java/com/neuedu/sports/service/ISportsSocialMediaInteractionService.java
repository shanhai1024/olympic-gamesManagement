package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsSocialMediaInteraction;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 媒体与公关-社交媒体互动Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsSocialMediaInteractionService extends IService<SportsSocialMediaInteraction>
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
     * 批量删除媒体与公关-社交媒体互动
     * 
     * @param ids 需要删除的媒体与公关-社交媒体互动主键集合
     * @return 结果
     */
    public int deleteSportsSocialMediaInteractionByIds(Long[] ids);

    /**
     * 删除媒体与公关-社交媒体互动信息
     * 
     * @param id 媒体与公关-社交媒体互动主键
     * @return 结果
     */
    public int deleteSportsSocialMediaInteractionById(Long id);
}
