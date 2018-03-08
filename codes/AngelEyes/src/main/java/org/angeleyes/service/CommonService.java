package org.angeleyes.service;



public interface CommonService {

    /**
     * 批量删除
     * @param tableName
     * @param rowName
     * @param rowIds
     * @return
     */
    void deleteBatchs(String tableName, String rowName, long[] rowIds);
}
