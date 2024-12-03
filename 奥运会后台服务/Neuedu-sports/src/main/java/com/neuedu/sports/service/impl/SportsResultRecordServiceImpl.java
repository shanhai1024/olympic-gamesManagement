package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsResultRecordMapper;
import com.neuedu.sports.domain.SportsResultRecord;
import com.neuedu.sports.service.ISportsResultRecordService;

/**
 * 赛事管理-结果记录Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsResultRecordServiceImpl extends ServiceImpl<SportsResultRecordMapper, SportsResultRecord> implements ISportsResultRecordService
{
    private final SportsResultRecordMapper sportsResultRecordMapper;

    /**
     * 查询赛事管理-结果记录
     * 
     * @param jie 赛事管理-结果记录主键
     * @return 赛事管理-结果记录
     */
    @Override
    public SportsResultRecord selectSportsResultRecordByJie(Long jie)
    {
        return sportsResultRecordMapper.selectSportsResultRecordByJie(jie);
    }

    /**
     * 查询赛事管理-结果记录列表
     * 
     * @param sportsResultRecord 赛事管理-结果记录
     * @return 赛事管理-结果记录
     */
    @Override
    public List<SportsResultRecord> selectSportsResultRecordList(SportsResultRecord sportsResultRecord)
    {
        return sportsResultRecordMapper.selectSportsResultRecordList(sportsResultRecord);
    }

    /**
     * 新增赛事管理-结果记录
     * 
     * @param sportsResultRecord 赛事管理-结果记录
     * @return 结果
     */
    @Override
    public int insertSportsResultRecord(SportsResultRecord sportsResultRecord)
    {
        sportsResultRecord.setCreateTime(DateUtils.getNowDate());
        return sportsResultRecordMapper.insertSportsResultRecord(sportsResultRecord);
    }

    /**
     * 修改赛事管理-结果记录
     * 
     * @param sportsResultRecord 赛事管理-结果记录
     * @return 结果
     */
    @Override
    public int updateSportsResultRecord(SportsResultRecord sportsResultRecord)
    {
        sportsResultRecord.setUpdateTime(DateUtils.getNowDate());
        return sportsResultRecordMapper.updateSportsResultRecord(sportsResultRecord);
    }

    /**
     * 批量删除赛事管理-结果记录
     * 
     * @param jies 需要删除的赛事管理-结果记录主键
     * @return 结果
     */
    @Override
    public int deleteSportsResultRecordByJies(Long[] jies)
    {
        return sportsResultRecordMapper.deleteSportsResultRecordByJies(jies);
    }

    /**
     * 删除赛事管理-结果记录信息
     * 
     * @param jie 赛事管理-结果记录主键
     * @return 结果
     */
    @Override
    public int deleteSportsResultRecordByJie(Long jie)
    {
        return sportsResultRecordMapper.deleteSportsResultRecordByJie(jie);
    }
}
