package com.neuedu.accommodation.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.accommodation.mapper.SportsAccommodationArrangementMapper;
import com.neuedu.accommodation.domain.SportsAccommodationArrangement;
import com.neuedu.accommodation.service.ISportsAccommodationArrangementService;

/**
 * 住宿安排Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAccommodationArrangementServiceImpl extends ServiceImpl<SportsAccommodationArrangementMapper, SportsAccommodationArrangement> implements ISportsAccommodationArrangementService
{
    private final SportsAccommodationArrangementMapper sportsAccommodationArrangementMapper;

    /**
     * 查询住宿安排
     * 
     * @param id 住宿安排主键
     * @return 住宿安排
     */
    @Override
    public SportsAccommodationArrangement selectSportsAccommodationArrangementById(Long id)
    {
        return sportsAccommodationArrangementMapper.selectSportsAccommodationArrangementById(id);
    }

    /**
     * 查询住宿安排列表
     * 
     * @param sportsAccommodationArrangement 住宿安排
     * @return 住宿安排
     */
    @Override
    public List<SportsAccommodationArrangement> selectSportsAccommodationArrangementList(SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        return sportsAccommodationArrangementMapper.selectSportsAccommodationArrangementList(sportsAccommodationArrangement);
    }

    /**
     * 新增住宿安排
     * 
     * @param sportsAccommodationArrangement 住宿安排
     * @return 结果
     */
    @Override
    public int insertSportsAccommodationArrangement(SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        sportsAccommodationArrangement.setCreateTime(DateUtils.getNowDate());
        return sportsAccommodationArrangementMapper.insertSportsAccommodationArrangement(sportsAccommodationArrangement);
    }

    /**
     * 修改住宿安排
     * 
     * @param sportsAccommodationArrangement 住宿安排
     * @return 结果
     */
    @Override
    public int updateSportsAccommodationArrangement(SportsAccommodationArrangement sportsAccommodationArrangement)
    {
        sportsAccommodationArrangement.setUpdateTime(DateUtils.getNowDate());
        return sportsAccommodationArrangementMapper.updateSportsAccommodationArrangement(sportsAccommodationArrangement);
    }

    /**
     * 批量删除住宿安排
     * 
     * @param ids 需要删除的住宿安排主键
     * @return 结果
     */
    @Override
    public int deleteSportsAccommodationArrangementByIds(Long[] ids)
    {
        return sportsAccommodationArrangementMapper.deleteSportsAccommodationArrangementByIds(ids);
    }

    /**
     * 删除住宿安排信息
     * 
     * @param id 住宿安排主键
     * @return 结果
     */
    @Override
    public int deleteSportsAccommodationArrangementById(Long id)
    {
        return sportsAccommodationArrangementMapper.deleteSportsAccommodationArrangementById(id);
    }
}
