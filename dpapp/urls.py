"""drpatientinteraction URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .import views

urlpatterns = [
    path('',views.home),
    path('login',views.login),
    path('adminhome',views.adminhome),
    path('admin_manage_doctor',views.admin_manage_doctor),
    path('admindeletedoctor/<doctor_id>/<login_id>',views.admindeletedoctor),
    path('adminupdatedoctor/<doctor_id>',views.adminupdatedoctor),
    path('admin_manage_department',views.admin_manage_department),
    path('admindeletedepartment/<department_id>',views.admindeletedepartment),
    path('adminupdatedepartment/<department_id>',views.adminupdatedepartment),
    path('admin_manage_lab',views.admin_manage_lab),
    path('admindeletepharmacy/<lab_id>/<login_id>',views.admindeletepharmacy),
    path('adminupdatepharmacy/<lab_id>',views.adminupdatepharmacy),
    path('adminviewpatients',views.adminviewpatients),
    path('adminviewpayments',views.adminviewpayments),
    path('admin_scheduledoctortime/<doctor_id>/<login_id>',views.admin_scheduledoctortime),


    path('doctorhome',views.doctorhome),
    path('doctorviewpatients',views.doctorviewpatients),
    path('doctorviewphysicalcondition',views.doctorviewphysicalcondition),
    # path('doctoraddprescription/<patient_id>',views.doctoraddprescription),
    path('doctordiseasedetails/<patient_id>/<booking_id>',views.doctordiseasedetails),
    path('staff_chat/<id>',views.staff_chat),
    path('staff_viewmsg',views.staff_viewmsg),
    path('staff_insert_chat/<msg>',views.staff_insert_chat),
    path('doctorviewschedule',views.doctorviewschedule),
    path('doctorview_booking/<schedule_id>',views.doctorview_booking),
    path('doctorview_booking/doctoraddprescription/<patient_id>/<booking_id>',views.doctoraddprescription),
    path('doctorview_booking/doctordiseasedetails/<patient_id>/<booking_id>',views.doctordiseasedetails),
    path('doctorview_booking/doctoraddtest/<patient_id>/<booking_id>',views.doctoraddtest),
    path('doctor_view_booking',views.doctor_view_booking),


    

    path('pharmacyhome',views.pharmacyhome),
    path('pharmacy_addmedicinedetails',views.pharmacy_addmedicinedetails),
    path('pharmacydeletemedicine/<medicine_id>',views.pharmacydeletemedicine),
    path('pharmacyupdatemedicine/<medicine_id>',views.pharmacyupdatemedicine),
    path('pharmacyviewprescription',views.pharmacyviewprescription),
    path('pharmacyaddamount/<med_pres_id>',views.pharmacyaddamount),
    path('pviewprescription',views.pviewprescription),


    path('userhome',views.userhome),
    path('userregistration',views.userregistration),
    path('useraddpatient',views.useraddpatient),
    path('userdeletepatient/<patient_id>',views.userdeletepatient),
    path('userupdatepatient/<patient_id>',views.userupdatepatient),
    path('userviewdoctors',views.userviewdoctors),
    path('userviewdoctorshedule/<doctor_id>',views.userviewdoctorshedule),
    path('userbookdoctor/<schedule_id>/<doctor_id>',views.userbookdoctor),
    path('userviewbooking',views.userviewbooking),
    path('usermakepayment/<int:booking_id>/<int:total>/', views.usermakepayment, name='usermakepayment'),
    path('userviewmedicalhist',views.userviewmedicalhist),
    path('userviewprescription',views.userviewprescription),
    path('userviewtest',views.userviewtest),
    path('userforwardtopharmacy/<med_pres_id>',views.userforwardtopharmacy),
    path('userforwardto_lab/<labtest_id>',views.userforwardto_lab),
    path('userpayemnttopharmacy/<int:med_pres_id>/<int:total>/', views.userpayemnttopharmacy, name='userpayemnttopharmacy'),
    path('user_chat/<id>',views.user_chat),
    path('user_viewmsg',views.user_viewmsg),
    path('user_insert_chat/<msg>',views.user_insert_chat),
    path('useradd_physical/<patient_id>',views.useradd_physical),
    path('userdelete_physical/<physical_condition_id>',views.userdelete_physical),
    path('userupdate_physical/<physical_condition_id>',views.userupdate_physical),
    path('usermake_payment/<user_id>',views.usermake_payment),
    path('u_makepayment',views.u_makepayment),



    path('labhome',views.labhome),
    path('lab_viewtest',views.lab_viewtest),
    path('labaddamount/<labtest_id>',views.labaddamount),
    path('userpayemntto_lab/<int:labtest_id>/<int:total>/', views.userpayemntto_lab, name='userpayemntto_lab'),
    path('labviewlab_test',views.labviewlab_test),


    path('test', views.hello1),
    path('homes', views.homes),



]
