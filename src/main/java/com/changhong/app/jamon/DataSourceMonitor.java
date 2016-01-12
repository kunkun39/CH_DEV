package com.changhong.app.jamon;

import com.jamonapi.proxy.MonProxyFactory;

import javax.sql.DataSource;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.logging.Logger;

/**
 * User: Jack Wang
 * Date: 16-1-11
 * Time: 上午11:21
 */
public class DataSourceMonitor implements DataSource {

    private DataSource realDataSource;

    public Connection getConnection() throws SQLException {
        return MonProxyFactory.monitor(realDataSource.getConnection());
    }

    public Connection getConnection(String arg0, String arg1) throws SQLException {
        return MonProxyFactory.monitor(realDataSource.getConnection(arg0, arg1));
    }

    public PrintWriter getLogWriter() throws SQLException {
        return realDataSource.getLogWriter();
    }

    public int getLoginTimeout() throws SQLException {
        return realDataSource.getLoginTimeout();
    }

    public void setLogWriter(PrintWriter arg0) throws SQLException {
        realDataSource.setLogWriter(arg0);
    }

    public void setLoginTimeout(int arg0) throws SQLException {
        realDataSource.setLoginTimeout(arg0);
    }

    public DataSource getRealDataSource() {
        return realDataSource;
    }

    public void setRealDataSource(DataSource realDataSource) {
        this.realDataSource = realDataSource;
    }

    public <T> T unwrap(Class<T> iface) throws SQLException {
        return realDataSource.unwrap(iface);
    }

    public boolean isWrapperFor(Class<?> iface) throws SQLException {
        return realDataSource.isWrapperFor(iface);
    }
}
