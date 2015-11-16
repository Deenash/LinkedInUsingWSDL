/**
 * Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package connection;

public interface Service extends java.rmi.Remote {
    public connection.UsersBean getProfile(java.lang.String user) throws java.rmi.RemoteException;
    public java.lang.String signUp(java.lang.String userName, java.lang.String password, java.lang.String fName, java.lang.String lName, java.lang.String city, java.lang.String mobile) throws java.rmi.RemoteException;
    public connection.UsersBean signIn(java.lang.String user, java.lang.String pass) throws java.rmi.RemoteException;
    public void updateProfile(java.lang.String user, java.lang.String sum, java.lang.String exp, java.lang.String edu, java.lang.String proj) throws java.rmi.RemoteException;
    public java.lang.String[] getConnections(java.lang.String user) throws java.rmi.RemoteException;
    public java.lang.String[] getConnReq(java.lang.String user) throws java.rmi.RemoteException;
}
