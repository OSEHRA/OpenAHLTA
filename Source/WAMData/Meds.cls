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
Attribute VB_Name = "Meds"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Attribute VB_Ext_KEY = "Collection" ,"UserDefinedCollection"
Attribute VB_Ext_KEY = "Member0" ,"MedOrder"
Option Explicit
Implements IPersist

'local variable to hold collection
Private mCol As Collection
Private mvarValidator As Validation
Private mvarMedOrder As MedOrder



Friend Sub Init(Validatator As Validation)
    Set mvarValidator = Validatator
End Sub
Public Function Clear()
    Set mCol = New Collection
End Function

Public Function Add(ByVal OrderID As String, ByVal ICD As String) As MedOrder
        
    'create a new object
    Dim objNewMember As MedOrder
    Dim objMed As MedOrder
    
    For Each objMed In mCol
        If objMed.OrderID = OrderID And objMed.ICD = ICD Then
            mvarValidator.ValidateDuplicateCode "Meds", "OrderID", OrderID
        End If
    Next
    
    Set objNewMember = New MedOrder

    'set the properties passed into the method
    objNewMember.OrderID = OrderID
    objNewMember.ICD = ICD
    objNewMember.Init mvarValidator
    
    mCol.Add objNewMember

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing

End Function

Public Property Get Item(vntIndexKey As Variant) As MedOrder
Attribute Item.VB_UserMemId = 0
    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
    'used when retrieving the number of elements in the
    'collection. Syntax: Debug.Print x.Count
    Count = mCol.Count
End Property


Public Sub Remove(vntIndexKey As Variant)
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)


    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mCol.[_NewEnum]
End Property


''''''''''''''''''''''''''''''''''''''''''''''
' Initialize/Terminate
''''''''''''''''''''''''''''''''''''''''''''''
Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
  Set mvarMedOrder = Nothing
    'destroys collection when this class is terminated
    Set mCol = Nothing
    Set mvarValidator = Nothing
End Sub

''''''''''''''''''''''''''''''''''''''''''''''
' Persistence Block
''''''''''''''''''''''''''''''''''''''''''''''
Private Function IPersist_ChildFactory() As Object
    Dim obj As MedOrder
    
    Set obj = New MedOrder
    obj.Init mvarValidator
    Set IPersist_ChildFactory = obj
    
End Function
Private Function IPersist_Persist() As String
    IPersist_Persist = PersistCollection(Me, mCol)
End Function
Private Function IPersist_Restore(ByVal Persist As String) As Boolean
    IPersist_Restore = RestoreCollection(Me, mCol, Persist)
End Function




