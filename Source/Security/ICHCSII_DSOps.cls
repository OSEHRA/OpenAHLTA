VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ICHCSII_DSOps"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Function GetSensitivitiesForNCIDs(NCIDs() As String, DomainNCID As String) As ICHCSII_Sensitive()
End Function

Public Sub SetSensitivities(SensitiveData() As ICHCSII_Sensitive, DomainNCID As String)
End Sub

Public Function Activate(ActivateKey As String) As Boolean
End Function
