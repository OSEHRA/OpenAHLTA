VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ErrorType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Option Explicit

Private mvarTypeCode As String 'local copy
Private mvarText As String 'local copy

Friend Property Let Text(ByVal vData As String)
    mvarText = vData
End Property

Public Property Get Text() As String
    Text = mvarText
End Property

Friend Property Let TypeCode(ByVal vData As String)
    mvarTypeCode = vData
End Property

Public Property Get TypeCode() As String
Attribute TypeCode.VB_UserMemId = 0
    TypeCode = mvarTypeCode
End Property


