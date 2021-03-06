'***************************************************************************************
'
'  Copyright (c) 2007-2012 Northrop Grumman Corporation
'
'  Licensed by Tricare Management Activity under license from the Copyright owner.
'
'  This text file must be included in all Derivative Works of the licensed Source Code.
'
'***************************************************************************************

VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XferTables"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private mTables As Collection

Public Property Get count() As Long
    count = mTables.count
End Property

Public Sub Add(objTable As XferTable)
    mTables.Add objTable, objTable.TableName
End Sub

Public Function Item(Index As Variant) As XferTable
    Set Item = mTables.Item(Index)
End Function

Public Function NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mTables.[_NewEnum]
End Function

Private Sub Class_Initialize()
    Set mTables = New Collection
End Sub

Private Sub Class_Terminate()
    Set mTables = Nothing
End Sub
