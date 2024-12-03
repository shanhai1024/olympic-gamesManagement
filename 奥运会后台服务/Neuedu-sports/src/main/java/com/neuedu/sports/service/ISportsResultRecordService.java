package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsResultRecord;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 赛事管理-结果记录Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsResultRecordService extends IService<SportsResultRecord>
{
    /**
     * 查询赛事管理-结果记录
     * 
     * @param jie 赛事管理-结果记录主键
     * @return 赛事管理-结果记录
     */
    public SportsResultRecord selectSportsResultRecordByJie(Long jie);

    /**
     * 查询赛事管理-结果记录列表
     * 
     * @param sportsResultRecord 赛事管理-结果记录
     * @return 赛事管理-结果记录集合
     */
    public List<SportsResultRecord> selectSportsResultRecordList(SportsResultRecord sportsResultRecord);

    /**
     * 新增赛事管理-结果记录
     * 
     * @param sportsResultRecord 赛事管理-结果记录
     * @return 结果
     */
    public int insertSportsResultRecord(SportsResultRecord sportsResultRecord);

    /**
     * 修改赛事管理-结果记录
     * 
     * @param sportsResultRecord 赛事管理-结果记录
     * @return 结果
     */
    public int updateSportsResultRecord(SportsResultRecord sportsResultRecord);

    /**
     * 批量删除赛事管理-结果记录
     * 
     * @param jies 需要删除的赛事管理-结果记录主键集合
     * @return 结果
     */
    public int deleteSportsResultRecordByJies(Long[] jies);

    /**
     * 删除赛事管理-结果记录信息
     * 
     * @param jie 赛事管理-结果记录主键
     * @return 结果
     */
    public int deleteSportsResultRecordByJie(Long jie);
}
