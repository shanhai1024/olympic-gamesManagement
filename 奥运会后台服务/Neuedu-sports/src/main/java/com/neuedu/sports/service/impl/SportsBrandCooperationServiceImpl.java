package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsBrandCooperationMapper;
import com.neuedu.sports.domain.SportsBrandCooperation;
import com.neuedu.sports.service.ISportsBrandCooperationService;

/**
 * 媒体与公关-品牌合作Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsBrandCooperationServiceImpl extends ServiceImpl<SportsBrandCooperationMapper, SportsBrandCooperation> implements ISportsBrandCooperationService
{
    private final SportsBrandCooperationMapper sportsBrandCooperationMapper;

    /**
     * 查询媒体与公关-品牌合作
     * 
     * @param id 媒体与公关-品牌合作主键
     * @return 媒体与公关-品牌合作
     */
    @Override
    public SportsBrandCooperation selectSportsBrandCooperationById(Long id)
    {
        return sportsBrandCooperationMapper.selectSportsBrandCooperationById(id);
    }

    /**
     * 查询媒体与公关-品牌合作列表
     * 
     * @param sportsBrandCooperation 媒体与公关-品牌合作
     * @return 媒体与公关-品牌合作
     */
    @Override
    public List<SportsBrandCooperation> selectSportsBrandCooperationList(SportsBrandCooperation sportsBrandCooperation)
    {
        return sportsBrandCooperationMapper.selectSportsBrandCooperationList(sportsBrandCooperation);
    }

    /**
     * 新增媒体与公关-品牌合作
     * 
     * @param sportsBrandCooperation 媒体与公关-品牌合作
     * @return 结果
     */
    @Override
    public int insertSportsBrandCooperation(SportsBrandCooperation sportsBrandCooperation)
    {
        sportsBrandCooperation.setCreateTime(DateUtils.getNowDate());
        return sportsBrandCooperationMapper.insertSportsBrandCooperation(sportsBrandCooperation);
    }

    /**
     * 修改媒体与公关-品牌合作
     * 
     * @param sportsBrandCooperation 媒体与公关-品牌合作
     * @return 结果
     */
    @Override
    public int updateSportsBrandCooperation(SportsBrandCooperation sportsBrandCooperation)
    {
        sportsBrandCooperation.setUpdateTime(DateUtils.getNowDate());
        return sportsBrandCooperationMapper.updateSportsBrandCooperation(sportsBrandCooperation);
    }

    /**
     * 批量删除媒体与公关-品牌合作
     * 
     * @param ids 需要删除的媒体与公关-品牌合作主键
     * @return 结果
     */
    @Override
    public int deleteSportsBrandCooperationByIds(Long[] ids)
    {
        return sportsBrandCooperationMapper.deleteSportsBrandCooperationByIds(ids);
    }

    /**
     * 删除媒体与公关-品牌合作信息
     * 
     * @param id 媒体与公关-品牌合作主键
     * @return 结果
     */
    @Override
    public int deleteSportsBrandCooperationById(Long id)
    {
        return sportsBrandCooperationMapper.deleteSportsBrandCooperationById(id);
    }
}
