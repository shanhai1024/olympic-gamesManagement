package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsResultRecord;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 赛事管理-结果记录Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsResultRecordMapper extends BaseMapper<SportsResultRecord>
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
     * 删除赛事管理-结果记录
     * 
     * @param jie 赛事管理-结果记录主键
     * @return 结果
     */
    public int deleteSportsResultRecordByJie(Long jie);

    /**
     * 批量删除赛事管理-结果记录
     * 
     * @param jies 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsResultRecordByJies(Long[] jies);
}
