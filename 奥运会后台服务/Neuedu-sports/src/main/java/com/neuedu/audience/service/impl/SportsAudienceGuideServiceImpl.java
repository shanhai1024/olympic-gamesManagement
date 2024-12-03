package com.neuedu.audience.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.audience.mapper.SportsAudienceGuideMapper;
import com.neuedu.audience.domain.SportsAudienceGuide;
import com.neuedu.audience.service.ISportsAudienceGuideService;

/**
 * 观众指南Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAudienceGuideServiceImpl extends ServiceImpl<SportsAudienceGuideMapper, SportsAudienceGuide> implements ISportsAudienceGuideService
{
    private final SportsAudienceGuideMapper sportsAudienceGuideMapper;

    /**
     * 查询观众指南
     * 
     * @param id 观众指南主键
     * @return 观众指南
     */
    @Override
    public SportsAudienceGuide selectSportsAudienceGuideById(Long id)
    {
        return sportsAudienceGuideMapper.selectSportsAudienceGuideById(id);
    }

    /**
     * 查询观众指南列表
     * 
     * @param sportsAudienceGuide 观众指南
     * @return 观众指南
     */
    @Override
    public List<SportsAudienceGuide> selectSportsAudienceGuideList(SportsAudienceGuide sportsAudienceGuide)
    {
        return sportsAudienceGuideMapper.selectSportsAudienceGuideList(sportsAudienceGuide);
    }

    /**
     * 新增观众指南
     * 
     * @param sportsAudienceGuide 观众指南
     * @return 结果
     */
    @Override
    public int insertSportsAudienceGuide(SportsAudienceGuide sportsAudienceGuide)
    {
        sportsAudienceGuide.setCreateTime(DateUtils.getNowDate());
        return sportsAudienceGuideMapper.insertSportsAudienceGuide(sportsAudienceGuide);
    }

    /**
     * 修改观众指南
     * 
     * @param sportsAudienceGuide 观众指南
     * @return 结果
     */
    @Override
    public int updateSportsAudienceGuide(SportsAudienceGuide sportsAudienceGuide)
    {
        sportsAudienceGuide.setUpdateTime(DateUtils.getNowDate());
        return sportsAudienceGuideMapper.updateSportsAudienceGuide(sportsAudienceGuide);
    }

    /**
     * 批量删除观众指南
     * 
     * @param ids 需要删除的观众指南主键
     * @return 结果
     */
    @Override
    public int deleteSportsAudienceGuideByIds(Long[] ids)
    {
        return sportsAudienceGuideMapper.deleteSportsAudienceGuideByIds(ids);
    }

    /**
     * 删除观众指南信息
     * 
     * @param id 观众指南主键
     * @return 结果
     */
    @Override
    public int deleteSportsAudienceGuideById(Long id)
    {
        return sportsAudienceGuideMapper.deleteSportsAudienceGuideById(id);
    }
}
