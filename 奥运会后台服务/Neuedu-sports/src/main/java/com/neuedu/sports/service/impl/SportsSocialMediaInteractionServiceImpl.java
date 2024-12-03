package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsSocialMediaInteractionMapper;
import com.neuedu.sports.domain.SportsSocialMediaInteraction;
import com.neuedu.sports.service.ISportsSocialMediaInteractionService;

/**
 * 媒体与公关-社交媒体互动Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsSocialMediaInteractionServiceImpl extends ServiceImpl<SportsSocialMediaInteractionMapper, SportsSocialMediaInteraction> implements ISportsSocialMediaInteractionService
{
    private final SportsSocialMediaInteractionMapper sportsSocialMediaInteractionMapper;

    /**
     * 查询媒体与公关-社交媒体互动
     * 
     * @param id 媒体与公关-社交媒体互动主键
     * @return 媒体与公关-社交媒体互动
     */
    @Override
    public SportsSocialMediaInteraction selectSportsSocialMediaInteractionById(Long id)
    {
        return sportsSocialMediaInteractionMapper.selectSportsSocialMediaInteractionById(id);
    }

    /**
     * 查询媒体与公关-社交媒体互动列表
     * 
     * @param sportsSocialMediaInteraction 媒体与公关-社交媒体互动
     * @return 媒体与公关-社交媒体互动
     */
    @Override
    public List<SportsSocialMediaInteraction> selectSportsSocialMediaInteractionList(SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        return sportsSocialMediaInteractionMapper.selectSportsSocialMediaInteractionList(sportsSocialMediaInteraction);
    }

    /**
     * 新增媒体与公关-社交媒体互动
     * 
     * @param sportsSocialMediaInteraction 媒体与公关-社交媒体互动
     * @return 结果
     */
    @Override
    public int insertSportsSocialMediaInteraction(SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        sportsSocialMediaInteraction.setCreateTime(DateUtils.getNowDate());
        return sportsSocialMediaInteractionMapper.insertSportsSocialMediaInteraction(sportsSocialMediaInteraction);
    }

    /**
     * 修改媒体与公关-社交媒体互动
     * 
     * @param sportsSocialMediaInteraction 媒体与公关-社交媒体互动
     * @return 结果
     */
    @Override
    public int updateSportsSocialMediaInteraction(SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        sportsSocialMediaInteraction.setUpdateTime(DateUtils.getNowDate());
        return sportsSocialMediaInteractionMapper.updateSportsSocialMediaInteraction(sportsSocialMediaInteraction);
    }

    /**
     * 批量删除媒体与公关-社交媒体互动
     * 
     * @param ids 需要删除的媒体与公关-社交媒体互动主键
     * @return 结果
     */
    @Override
    public int deleteSportsSocialMediaInteractionByIds(Long[] ids)
    {
        return sportsSocialMediaInteractionMapper.deleteSportsSocialMediaInteractionByIds(ids);
    }

    /**
     * 删除媒体与公关-社交媒体互动信息
     * 
     * @param id 媒体与公关-社交媒体互动主键
     * @return 结果
     */
    @Override
    public int deleteSportsSocialMediaInteractionById(Long id)
    {
        return sportsSocialMediaInteractionMapper.deleteSportsSocialMediaInteractionById(id);
    }
}
