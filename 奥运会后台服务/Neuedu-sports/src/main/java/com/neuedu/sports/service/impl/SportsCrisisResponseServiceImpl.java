package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsCrisisResponseMapper;
import com.neuedu.sports.domain.SportsCrisisResponse;
import com.neuedu.sports.service.ISportsCrisisResponseService;

/**
 * 安全与健康协议-危机响应Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsCrisisResponseServiceImpl extends ServiceImpl<SportsCrisisResponseMapper, SportsCrisisResponse> implements ISportsCrisisResponseService
{
    private final SportsCrisisResponseMapper sportsCrisisResponseMapper;

    /**
     * 查询安全与健康协议-危机响应
     * 
     * @param id 安全与健康协议-危机响应主键
     * @return 安全与健康协议-危机响应
     */
    @Override
    public SportsCrisisResponse selectSportsCrisisResponseById(Long id)
    {
        return sportsCrisisResponseMapper.selectSportsCrisisResponseById(id);
    }

    /**
     * 查询安全与健康协议-危机响应列表
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 安全与健康协议-危机响应
     */
    @Override
    public List<SportsCrisisResponse> selectSportsCrisisResponseList(SportsCrisisResponse sportsCrisisResponse)
    {
        return sportsCrisisResponseMapper.selectSportsCrisisResponseList(sportsCrisisResponse);
    }

    /**
     * 新增安全与健康协议-危机响应
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 结果
     */
    @Override
    public int insertSportsCrisisResponse(SportsCrisisResponse sportsCrisisResponse)
    {
        sportsCrisisResponse.setCreateTime(DateUtils.getNowDate());
        return sportsCrisisResponseMapper.insertSportsCrisisResponse(sportsCrisisResponse);
    }

    /**
     * 修改安全与健康协议-危机响应
     * 
     * @param sportsCrisisResponse 安全与健康协议-危机响应
     * @return 结果
     */
    @Override
    public int updateSportsCrisisResponse(SportsCrisisResponse sportsCrisisResponse)
    {
        sportsCrisisResponse.setUpdateTime(DateUtils.getNowDate());
        return sportsCrisisResponseMapper.updateSportsCrisisResponse(sportsCrisisResponse);
    }

    /**
     * 批量删除安全与健康协议-危机响应
     * 
     * @param ids 需要删除的安全与健康协议-危机响应主键
     * @return 结果
     */
    @Override
    public int deleteSportsCrisisResponseByIds(Long[] ids)
    {
        return sportsCrisisResponseMapper.deleteSportsCrisisResponseByIds(ids);
    }

    /**
     * 删除安全与健康协议-危机响应信息
     * 
     * @param id 安全与健康协议-危机响应主键
     * @return 结果
     */
    @Override
    public int deleteSportsCrisisResponseById(Long id)
    {
        return sportsCrisisResponseMapper.deleteSportsCrisisResponseById(id);
    }
}
