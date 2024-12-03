package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsAthleteEligibilityReviewMapper;
import com.neuedu.sports.domain.SportsAthleteEligibilityReview;
import com.neuedu.sports.service.ISportsAthleteEligibilityReviewService;

/**
 * 运动员管理-参赛资格审核Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAthleteEligibilityReviewServiceImpl extends ServiceImpl<SportsAthleteEligibilityReviewMapper, SportsAthleteEligibilityReview> implements ISportsAthleteEligibilityReviewService
{
    private final SportsAthleteEligibilityReviewMapper sportsAthleteEligibilityReviewMapper;

    /**
     * 查询运动员管理-参赛资格审核
     * 
     * @param id 运动员管理-参赛资格审核主键
     * @return 运动员管理-参赛资格审核
     */
    @Override
    public SportsAthleteEligibilityReview selectSportsAthleteEligibilityReviewById(Long id)
    {
        return sportsAthleteEligibilityReviewMapper.selectSportsAthleteEligibilityReviewById(id);
    }

    /**
     * 查询运动员管理-参赛资格审核列表
     * 
     * @param sportsAthleteEligibilityReview 运动员管理-参赛资格审核
     * @return 运动员管理-参赛资格审核
     */
    @Override
    public List<SportsAthleteEligibilityReview> selectSportsAthleteEligibilityReviewList(SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        return sportsAthleteEligibilityReviewMapper.selectSportsAthleteEligibilityReviewList(sportsAthleteEligibilityReview);
    }

    /**
     * 新增运动员管理-参赛资格审核
     * 
     * @param sportsAthleteEligibilityReview 运动员管理-参赛资格审核
     * @return 结果
     */
    @Override
    public int insertSportsAthleteEligibilityReview(SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        sportsAthleteEligibilityReview.setCreateTime(DateUtils.getNowDate());
        return sportsAthleteEligibilityReviewMapper.insertSportsAthleteEligibilityReview(sportsAthleteEligibilityReview);
    }

    /**
     * 修改运动员管理-参赛资格审核
     * 
     * @param sportsAthleteEligibilityReview 运动员管理-参赛资格审核
     * @return 结果
     */
    @Override
    public int updateSportsAthleteEligibilityReview(SportsAthleteEligibilityReview sportsAthleteEligibilityReview)
    {
        sportsAthleteEligibilityReview.setUpdateTime(DateUtils.getNowDate());
        return sportsAthleteEligibilityReviewMapper.updateSportsAthleteEligibilityReview(sportsAthleteEligibilityReview);
    }

    /**
     * 批量删除运动员管理-参赛资格审核
     * 
     * @param ids 需要删除的运动员管理-参赛资格审核主键
     * @return 结果
     */
    @Override
    public int deleteSportsAthleteEligibilityReviewByIds(Long[] ids)
    {
        return sportsAthleteEligibilityReviewMapper.deleteSportsAthleteEligibilityReviewByIds(ids);
    }

    /**
     * 删除运动员管理-参赛资格审核信息
     * 
     * @param id 运动员管理-参赛资格审核主键
     * @return 结果
     */
    @Override
    public int deleteSportsAthleteEligibilityReviewById(Long id)
    {
        return sportsAthleteEligibilityReviewMapper.deleteSportsAthleteEligibilityReviewById(id);
    }
}
