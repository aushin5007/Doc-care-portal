from datetime import *
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import get_object_or_404, render
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
# from flask import Flask, request, url_for, redirect, render_template
import pickle
import numpy as np
import os



from dpapp.models import *

# Create your views here.
def home(request):
    return render(request,'home.html')

def login(request):
    print("sdfghj")
    if request.method=='POST':
        uname=request.POST['uname']
        pwd=request.POST['pwd']
        try:
            lg=login1.objects.get(username=uname,password=pwd)
            if lg:

                request.session['login_id']=lg.pk
                lid=request.session['login_id']
                print("==================================================================",request.session['login_id'])
                if lg.usertype=='admin':
                    return HttpResponse("<script>alert('login successfully!');window.location='/adminhome';</script>")
                if lg.usertype=='pharmacy':
                    q=pharmacy.objects.get(login_id=request.session['login_id'])
                    if q:
                        pharmacy_id=q.pharmacy_id
                        request.session['pharmacy_ids']=pharmacy_id
                
                    return HttpResponse("<script>alert('login successfully.!');window.location='/pharmacyhome';</script>")
                if lg.usertype=='doctor':
                    q=doctor.objects.get(login_id=request.session['login_id'])
                    if q:
                        doctor_id=q.doctor_id
                        request.session['doctor_ids']=doctor_id
                
                    return HttpResponse("<script>alert('login successfully.!');window.location='/doctorhome';</script>")
                
                if lg.usertype=='user':
                    q=user.objects.get(login_id=request.session['login_id'])
                    if q:
                        user_id=q.user_id
                        request.session['user_ids']=user_id
                        print("myid",request.session['user_ids'])
                    
                
                    return HttpResponse("<script>alert('login successfully');window.location='/userhome';</script>")
                if lg.usertype=='lab':
                    q=lab.objects.get(login_id=request.session['login_id'])
                    if q:
                        lab_id=q.lab_id
                        request.session['lab_ids']=lab_id
                        print("myid",request.session['lab_ids'])
                    
                
                    return HttpResponse("<script>alert('login successfully');window.location='/labhome';</script>")


        except:
            return HttpResponse("<script>alert('login Failed...!!!!');window.location='login';</script>")  
    return render(request,'login.html')
def adminhome(request):
    return render(request,'adminhome.html')
def admin_manage_doctor(request):
    qry1=doctor.objects.all()
    qry2=department.objects.all()
    lid=request.session['login_id']
    if request.method=="POST":
        fns=request.POST['fname']
        ln=request.POST['lname']
        pl=request.POST['plc']
        ph=request.POST['phone']
        em=request.POST['email']
        ql=request.POST['qualification']
        depmt=request.POST['depmt']
        uname=request.POST['uname']
        pwd=request.POST['pwd']
        image=request.FILES['file']
        fn=FileSystemStorage()
        fs=fn.save(image.name,image)

        q=doctor.objects.filter(email=em)
        if q:
            return HttpResponse("<script>alert('This email is Already added ');window.location='/admin_manage_doctor'</script>")
        else:
            lg=login1(username=uname,password=pwd,usertype='doctor')
            lg.save()
            print('+++++++++++++++++++',lg)
            qry=doctor(fname=fns,lname=ln,phone=ph,email=em,qualification=ql,login=lg,place=pl,image=fs,department_id=depmt)
            qry.save()
            return HttpResponse("<script>alert('added successfully');window.location='/admin_manage_doctor' ;</script>")

    return render(request,'admin_manage_doctor.html',{'qry1':qry1,'qry2':qry2})


def admindeletedoctor(request,doctor_id,login_id):
    s=doctor.objects.get(doctor_id=doctor_id)
    s.delete()
    q=login1.objects.get(login_id=login_id)
    q.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/admin_manage_doctor';</script>")

def adminupdatedoctor(request,doctor_id):
    qry1=doctor.objects.all()
    v=doctor.objects.get(doctor_id=doctor_id)
    if request.method=='POST':
        fname=request.POST['fname']
        lname=request.POST['lname']
        plc=request.POST['plc']
        phone=request.POST['phone']
        email=request.POST['email']
        qualification=request.POST['qualification']

        v.fname=fname
        v.lname=lname
        v.place=plc
        v.phone=phone
        v.email=email
        v.qualification=qualification
        
        v.save()
        return HttpResponse("<script>alert('updated successfully');window.location='/admin_manage_doctor';</script>")

    return render(request,'admin_manage_doctor.html',{'r':v,'qry1':qry1})

def admin_scheduledoctortime(request,doctor_id,login_id):
    if 'submit' in request.POST:
        ft=request.POST['stime']
        et=request.POST['etime']
        da=request.POST['date']
        amt=request.POST['amt']
        qry=schedule(start_time=ft,end_time=et,schedule_date=da,fee_amount=amt,doctor_id=doctor_id)
        qry.save()
        return HttpResponse("<script>alert(' scheduled successfully');window.location='/admin_manage_doctor';</script>")

  
    return render(request,'admin_scheduledoctortime.html')


def admin_manage_department(request):
    qry2=department.objects.all()
    if request.method=="POST":
        dn=request.POST['dname']
      
        q=department.objects.filter(dept_name=dn)
        if q:
            return HttpResponse("<script>alert('This department is Already added ');window.location='/admin_manage_department'</script>")
        else:
            qry=department(dept_name=dn)
            qry.save()
            return HttpResponse("<script>alert('added successfully');window.location='/admin_manage_department' ;</script>")

    return render(request,'admin_manage_department.html',{'qry2':qry2})
def admindeletedepartment(request,department_id):
    s=department.objects.get(department_id=department_id)
    s.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/admin_manage_department';</script>")

def adminupdatedepartment(request,department_id):
    qry2=department.objects.all()
    v=department.objects.get(department_id=department_id)
    if request.method=='POST':
        dept_name=request.POST['dname']
        v.dept_name=dept_name
        v.save()
        return HttpResponse("<script>alert('updated successfully');window.location='/admin_manage_department';</script>")
    return render(request,'admin_manage_department.html',{'r':v,'qry2':qry2})

def admin_manage_lab(request):
    qry1=lab.objects.all()
   
    lid=request.session['login_id']
    if request.method=="POST":
        if qry1:
            return HttpResponse("<script>alert('already existed');window.location='/adminhome';</script>")
        else:

            pn=request.POST['pname']
            ph=request.POST['phone']
            em=request.POST['email']
            uname=request.POST['uname']
            pwd=request.POST['pwd']
            lg=login1(username=uname,password=pwd,usertype='lab')
            lg.save()
            print('+++++++++++++++++++',lg)
            qry=lab(lab_name=pn,lab_phone=ph,lab_email=em,login=lg)
            qry.save()
            return HttpResponse("<script>alert('added successfully');window.location='/admin_manage_lab' ;</script>")

    return render(request,'admin_manage_pharmacy.html',{'qry1':qry1})


def admindeletepharmacy(request,lab_id,login_id):
    s=lab.objects.get(lab_id=lab_id)
    q=login1.objects.get(login_id=login_id)
    q.delete()
    s.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/admin_manage_lab';</script>")

def adminupdatepharmacy(request,lab_id):
    qry1=lab.objects.all()
    v=lab.objects.get(lab_id=lab_id)
    if request.method=='POST':
        pn=request.POST['pname']
        ph=request.POST['phone']
        em=request.POST['email']
        

        v.lab_name=pn
        v.lab_phone=ph
        v.lab_email=em
       
        v.save()
        return HttpResponse("<script>alert('updated successfully');window.location='/admin_manage_lab';</script>")

    return render(request,'admin_manage_pharmacy.html',{'r':v,'qry1':qry1})

def adminviewpatients(request):
        qry1=patients.objects.all()
        
        return render(request,'adminviewpatients.html',{'qry1':qry1})

def pviewprescription(request):
    qry1=medicine_prescriptions.objects.all()
    if request.method == 'POST':
        from_date = request.POST.get('fd')
        to_date = request.POST.get('td')

        print("From Date:", from_date)
        print("To Date:", to_date)

        if from_date and to_date:  # Check if both dates are provided
            # Filter queryset to get payments between from_date and to_date
            qry1 = medicine_prescriptions.objects.filter(date_time__range=[from_date, to_date])
    
    return render(request,'adminviewprescription.html',{'qry1':qry1})
def labviewlab_test(request):
    qry1=labtest.objects.all()
    if request.method == 'POST':
        from_date = request.POST.get('fd')
        to_date = request.POST.get('td')

        print("From Date:", from_date)
        print("To Date:", to_date)

        if from_date and to_date:  # Check if both dates are provided
            # Filter queryset to get payments between from_date and to_date
            qry1 = labtest.objects.filter(test_date__range=[from_date, to_date])
    
    return render(request,'adminviewlab_test.html',{'qry1':qry1})
def adminviewpayments(request):
    qry1 = payments.objects.all() 

    if request.method == 'POST':
        from_date = request.POST.get('fd')
        to_date = request.POST.get('td')

        print("From Date:", from_date)
        print("To Date:", to_date)

        if from_date and to_date:  # Check if both dates are provided
            # Filter queryset to get payments between from_date and to_date
            qry1 = qry1.filter(payment_date__range=[from_date, to_date])

        # Debug: print the resulting SQL query
        print("SQL Query:", qry1.query)

    return render(request, 'adminviewpayments.html', {'qry1': qry1})




def doctorhome(request):
    return render(request,'doctorhome.html')

def doctorviewpatients(request):
        qry1=patients.objects.all()
        
        return render(request,'doctorviewpatients.html',{'qry1':qry1})

def doctor_view_booking(request):
        qry1=bookings.objects.filter(schedule__doctor=request.session['doctor_ids'])
        print("============",qry1)
        
        return render(request,'doctor_view_booking.html',{'qry1':qry1})

def doctoraddtest(request,patient_id,booking_id):
    cdate=date.today()
    booking_ids = bookings.objects.filter(patient_id=patient_id).values_list('booking_id', flat=True).first()
    if request.method=='POST':
        pn=request.POST['name']
        ph=request.POST['des']
        qry=labtest(booking_id=booking_ids,test_name=pn,test_description=ph,test_date=cdate,test_amount='pending',test_status='pending',lab_id='01')
        qry.save()
        return HttpResponse("<script>alert('added successfully');window.location='/doctorhome' ;</script>")
        
    return render(request,'doctoraddtest.html')

def doctorviewphysicalcondition(request):
        qry1=physical_conditions.objects.all()
        
        return render(request,'doctorviewphysical_conditions.html',{'qry1':qry1})

def doctoraddprescription(request,patient_id,booking_id):
    cdate=date.today()
    a=medicines.objects.all()
    booking_ids = bookings.objects.filter(patient_id=patient_id).values_list('booking_id', flat=True).first()
    if request.method=='POST':
        pn=request.POST['medicine_id']
        ph=request.POST['des']
        qry=medicine_prescriptions(booking_id=booking_ids,medicine_id=pn,pres_description=ph,date_time=cdate,p_amount='pending',pres_status='pending')
        qry.save()
        return HttpResponse("<script>alert('added successfully');window.location='/doctorhome' ;</script>")
    return render(request,'doctoraddprescription.html',{'a':a})

def doctordiseasedetails(request,patient_id,booking_id):
    cdate=date.today()
    booking_ids = bookings.objects.filter(patient_id=patient_id).values_list('booking_id', flat=True).first()
    if booking_ids:
        if request.method=='POST':
            ph=request.POST['des']
            qry=medical_notes(booking_id=booking_ids,description=ph,date_time=cdate)
            qry.save()
            return HttpResponse("<script>alert('added successfully');window.location='/doctorhome' ;</script>")
    else:
        return HttpResponse("<script>alert('no booking ');window.location='/doctorhome' ;</script>")
    return render(request,'doctordiseasedetails.html')
def doctorviewschedule(request):
    qry1=schedule.objects.filter(doctor_id=request.session['doctor_ids'])
    return render(request,'doctorviewschedule.html',{'qry1':qry1})
def doctorview_booking(request,schedule_id):
    qry1=bookings.objects.filter(schedule_id=schedule_id)
    return render(request,'doctorview_booking.html',{'qry1':qry1})



def pharmacyhome(request):
    return render(request,'pharmacyhome.html')
def pharmacy_addmedicinedetails(request):
    qry1=medicines.objects.all()
    if request.method=='POST':
        mn=request.POST['mn']
        des=request.POST['des']
        aq=request.POST['aq']
        ed=request.POST['ed']
        rt=request.POST['rt']
        qry=medicines(medicine_name=mn,description=des,available_qty=aq,expiry_date=ed,rate=rt,pharmacy_id=request.session['pharmacy_ids'])
        qry.save()
        return HttpResponse("<script>alert('added successfully');window.location='/pharmacy_addmedicinedetails' ;</script>")

    return render(request,'pharmacy_addmedicinedetails.html',{'qry1':qry1})
def pharmacydeletemedicine(request,medicine_id):
    s=medicines.objects.get(medicine_id=medicine_id)
    s.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/pharmacy_addmedicinedetails';</script>")

def pharmacyupdatemedicine(request,medicine_id):
    qry1=medicines.objects.all()
    v=medicines.objects.get(medicine_id=medicine_id)
    if request.method=='POST':
        mn=request.POST['mn']
        des=request.POST['des']
        aq=request.POST['aq']
        ed=request.POST['ed']
        rt=request.POST['rt']
        

        v.medicine_name=mn
        v.description=des
        v.available_qty=aq
        v.expiry_date=ed
        v.rate=rt
       
        v.save()
        return HttpResponse("<script>alert('updated successfully');window.location='/pharmacy_addmedicinedetails';</script>")

    return render(request,'pharmacy_addmedicinedetails.html',{'r':v,'qry1':qry1})

def pharmacyviewprescription(request):
    qry1=medicine_prescriptions.objects.all()
    return render(request,'pharmacyviewprescription.html',{'qry1':qry1})
def pharmacyaddamount(request,med_pres_id):
    qry1=medicine_prescriptions.objects.get(med_pres_id=med_pres_id)
    if request.method=='POST':
        am=request.POST['amt']
        qry1.p_amount=am
        qry1.pres_status='accept'
        qry1.save()
        return HttpResponse("<script>alert('added successfully');window.location='/pharmacyhome' ;</script>")

    return render(request,'pharmacyaddamount.html',{'qry1':qry1})

from datetime import date
from .models import subscription
from django.shortcuts import render

from datetime import date
from datetime import datetime
from .models import subscription
from django.shortcuts import render

def userhome(request):
    cdate = date.today()
    data = []
    bata = []
    try:
        s = subscription.objects.get(user_id=request.session.get('user_ids'))
        to_date_str = s.to_date  # Assuming to_date is stored as a string
        to_date = datetime.strptime(to_date_str, '%Y-%m-%d').date()  # Convert to_date string to datetime.date
        print("------------", to_date)
        if cdate <= to_date:
            data = [s]  # Add subscription to data list if it's still active
        else:
            bata = [s]  # Add subscription to bata list if it's expired
    except subscription.DoesNotExist:
        print("************* Subscription not found for this user")
    
    return render(request, 'userhome.html', {'data': data, 'bata': bata})


def userregistration(request):
    if request.method=="POST":
        fn=request.POST['fname']
        ln=request.POST['lname']
        pl=request.POST['plc']
        ph=request.POST['phone']
        em=request.POST['email']
        uname=request.POST['uname']
        pwd=request.POST['pwd']
        q=user.objects.filter(email=em)
        if q:
            return HttpResponse("<script>alert('This email is Already added ');window.location='/userregistration'</script>")
        else:
            lg=login1(username=uname,password=pwd,usertype='user')
            lg.save()
            print('+++++++++++++++++++',lg)
            qry=user(user_fname=fn,user_lname=ln,phone=ph,email=em,login=lg,place=pl)
            qry.save()
            user_id = qry.user_id
        return HttpResponseRedirect("/usermake_payment/%s"%user_id)    
    return render(request,'userregistration.html')
def usermake_payment(request,user_id):
    total=499
    cdate=date.today()
    to_date = cdate + timedelta(days=90)
    if request.method == "POST":
        q = payments(amount=total, payment_date=cdate, booking_id=user_id, payment_type='subscription')
        q.save()
        f=subscription(amount=total,from_date=cdate,to_date=to_date,user_id=user_id,sub_status='subscribed')
        f.save()

        return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/login';</script>")
    


    return render(request,'usermakepayment.html',{'total': total})

def u_makepayment(request):
    total=499
    cdate=date.today()
    to_date = cdate + timedelta(days=90)
    if request.method == "POST":
        q = payments(amount=total, payment_date=cdate, booking_id=request.session['user_ids'], payment_type='subscription')
        q.save()
        f=subscription.objects.get(user_id=request.session['user_ids'])
        f.to_date=to_date
        f.from_date=cdate
        f.save()

        return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/userhome';</script>")
    


    return render(request,'usermakepayment.html',{'total': total})


def useraddpatient(request):
    qry1=patients.objects.filter(user_id=request.session['user_ids'])
    if request.method=="POST":
        fn=request.POST['fname']
        ln=request.POST['lname']
        pl=request.POST['plc']
        ph=request.POST['phone']
        em=request.POST['email']
        housename=request.POST['hname']
        gender=request.POST['gen']
        bldgrp=request.POST['bld']
        dob=request.POST['dob']
        q=user.objects.filter(email=em)
        if q:
            return HttpResponse("<script>alert('This email is Already added ');window.location='/userregistration'</script>")
        else:
            qry=patients(patient_fname=fn,patient_lname=ln,phone=ph,email=em,place=pl,housename=housename,gender=gender,blood_group=bldgrp,dob=dob,user_id=request.session['user_ids'])
            qry.save()
            return HttpResponse("<script>alert('added successfully');window.location='/useraddpatient' ;</script>")
    return render(request,'useraddpatient.html',{'qry1':qry1})
def userdeletepatient(request,patient_id):
    s=patients.objects.filter(patient_id=patient_id)
    s.delete()
    return HttpResponse("<script>alert('deleted successfully');window.location='/useraddpatient';</script>")

def userupdatepatient(request,patient_id):
    qry1=patients.objects.all()
    v=patients.objects.get(patient_id=patient_id)
    if request.method=='POST':
        fn=request.POST['fname']
        ln=request.POST['lname']
        pl=request.POST['plc']
        ph=request.POST['phone']
        em=request.POST['email']
        housename=request.POST['hname']
        gender=request.POST['gen']
        bldgrp=request.POST['bld']
        dob=request.POST['dob']
        

        v.patient_fname=fn
        v.patient_lname=ln
        v.place=pl
        v.phone=ph
        v.email=em
        v.housename=housename
        v.gender=gender
        v.blood_group=bldgrp
        v.dob=dob
       
        v.save()
        return HttpResponse("<script>alert('updated successfully');window.location='/useraddpatient';</script>")

    return render(request,'useraddpatient.html',{'r':v,'qry1':qry1})

def userviewdoctors(request):
    qry1=doctor.objects.all()
    
    # return HttpResponse("<script>alert('deleted successfully');window.location='/useraddpatient';</script>")
    return render(request,'userviewdoctors.html',{'qry1':qry1})

def userviewdoctorshedule(request,doctor_id):
    qry1=schedule.objects.filter(doctor_id=doctor_id)
    request.session['dids']=doctor_id
    # return HttpResponse("<script>alert('deleted successfully');window.location='/useraddpatient';</script>")
    return render(request,'userviewdoctorshedule.html',{'qry1':qry1})

def userbookdoctor(request,schedule_id,doctor_id):
    cdate=date.today()
    qry1=patients.objects.filter(user_id=request.session['user_ids'])

    print(qry1)
    if request.method=='POST':
        mn=request.POST['pid']
        qry=bookings(schedule_id=schedule_id,patient_id=mn,booking_date_time=cdate,Booking_status='pending',user_id=request.session['user_ids'])
        qry.save()
        did=request.session['dids']
        return HttpResponse("<script>alert('Booked successfully');window.location='/userviewdoctorshedule/" + str(did) + "';</script>")


    return render(request,'userbookdoctor.html',{'qry1':qry1})


def userviewbooking(request):
    qry1=bookings.objects.filter(user_id=request.session['user_ids'])
    return render(request,'userviewbooking.html',{'qry1':qry1})
def usermakepayment(request,booking_id,total):
    cdate=date.today()

   
  
    if request.method == "POST":
        q = payments(amount=total, payment_date=cdate, booking_id=booking_id, payment_type='doctor')
        q.save()

        q1 = bookings.objects.get(booking_id=booking_id)
        q1.Booking_status = 'paid'
        q1.save()    
        return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/userhome';</script>")
    
    return render(request, 'usermakepayment.html', {'total': total, 'booking_id': booking_id})

def userviewmedicalhist(request):
    qry1=physical_conditions.objects.all()
        
    return render(request,'userviewmedicalhist.html',{'qry1':qry1})
def userviewprescription(request):
    booking_ids = bookings.objects.filter(user_id=request.session['user_ids']).values_list('booking_id', flat=True)

    # Retrieve medicine prescriptions for the specified booking_ids
    qry1 = medicine_prescriptions.objects.filter(booking_id__in=booking_ids)

    return render(request,'userviewprescription.html',{'qry1':qry1})
def userviewtest(request):
    booking_ids = bookings.objects.filter(user_id=request.session['user_ids']).values_list('booking_id', flat=True)

    # Retrieve lab test for the specified booking_ids
    qry1 = labtest.objects.filter(booking_id__in=booking_ids)

    return render(request,'userviewtest.html',{'qry1':qry1})


def userforwardtopharmacy(request,med_pres_id):
    q1 = medicine_prescriptions.objects.get(med_pres_id=med_pres_id)
    q1.pres_status = 'Forwarded'
    q1.save()  
    return HttpResponse("<script>alert('forwarded successfully');window.location='/userviewprescription';</script>")
def userforwardto_lab(request,labtest_id):
    q1 = labtest.objects.get(labtest_id=labtest_id)
    q1.test_status = 'Forwarded'
    q1.save()  
    return HttpResponse("<script>alert('forwarded successfully');window.location='/userviewtest';</script>")


def userpayemnttopharmacy(request,med_pres_id,total):
   
  
    if request.method == "POST":
        q = payments(amount=total, payment_date=date.today(), booking_id=med_pres_id, payment_type='pharmacy')
        q.save()

        q1 = medicine_prescriptions.objects.get(med_pres_id=med_pres_id)
        q1.pres_status= 'paid'
        q1.save()    
        return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/userviewprescription';</script>")
    
    return render(request,'userpayemnttopharmacy.html', {'total': total, 'med_pres_id': med_pres_id})

def useradd_physical(request,patient_id):
    qry1=physical_conditions.objects.filter(patient_id=patient_id)
    cdate=date.today()
    if request.method=="POST":
        bld=request.POST['bl']
        ln=request.POST['su']
        pl=request.POST['ch']
        ph=request.POST['we']
        em=request.POST['he']
        d=request.POST['desc']
        im=request.FILES['report']
        fs=FileSystemStorage()
        fns=fs.save(im.name,im)
      
     
        qry=physical_conditions(blood_pressure=bld,sugar=ln,cholesterol=pl,weight=ph,height=em,date_time=cdate,report=fns,description=d,patient_id=patient_id)
        qry.save()
        return HttpResponseRedirect("/useradd_physical/%s"%patient_id)
    return render(request,'useradd_physical.html',{'qry1':qry1})
def userdelete_physical(request,physical_condition_id):
    s=physical_conditions.objects.filter(physical_condition_id=physical_condition_id)
    s.delete()
    return HttpResponseRedirect("/useradd_physical/%s"%physical_condition_id)

def userupdate_physical(request,physical_condition_id):
    qry1=physical_conditions.objects.all()
    cdate=date.today()

    v=physical_conditions.objects.get(physical_condition_id=physical_condition_id)
    if request.method=='POST':
        bld=request.POST['bl']
        ln=request.POST['su']
        pl=request.POST['ch']
        ph=request.POST['we']
        em=request.POST['he']
        d=request.POST['desc']
        

        v.blood_pressure=bld
        v.sugar=ln
        v.cholesterol=pl
        v.weight=ph
        v.height=em
        v.description=d
        v.date_time=cdate
       
        v.save()
        return HttpResponseRedirect("/useradd_physical/%s"%physical_condition_id)

    return render(request,'useradd_physical.html',{'r':v,'qry1':qry1})




def staff_chat(request,id):
    client_id=id
    request.session["client_id"]=client_id
    from_id=request.session['login_id']
    print("hiiiiiiiiii")
    return render(request,"chat.html",{"toid":id})

def staff_viewmsg(request):
    current_user_id = request.session['login_id']
    a=[]
    chat_messages = chat.objects.filter(
        Q(from_id=current_user_id, to_id=request.session['client_id']) | Q(from_id=request.session['client_id'], to_id=current_user_id)
    )
    for i in chat_messages:
        a.append({"chat_id":i.id,"from_id":i.from_id_id,"message":i.message,"date_time":i.date_time})
    p=user.objects.get(login_id=request.session["client_id"])
    print(chat_messages,p.user_fname)
    first_name=p.user_fname+" "+p.user_lname
    print(a)
    return JsonResponse({'data':a,'first_name':first_name,'photo':"/static/img.png"})
    


def staff_insert_chat(request,msg):
    import datetime
    ry=chat(from_id_id=request.session['login_id'],to_id_id=request.session['client_id'],message=msg,date_time=datetime.datetime.now())
    ry.save()
    return JsonResponse({'status':"ok"})




def user_chat(request,id):
    dr_id=id
    request.session["dr_id"]=dr_id
    # from_id=request.session['lid']
    print("hiiiiiiiiii")
    return render(request,"userchat.html",{"toid":id})

def user_viewmsg(request):
    current_user_id = request.session['login_id']
    a=[]
    chat_messages = chat.objects.filter(
        Q(from_id=current_user_id, to_id=request.session['dr_id']) | Q(from_id=request.session['dr_id'], to_id=current_user_id)
    )
    for i in chat_messages:
        a.append({"chat_id":i.id,"from_id":i.from_id_id,"message":i.message,"date_time":i.date_time})
    p=doctor.objects.get(login_id=request.session["dr_id"])
    print(chat_messages,p.fname)
    first_name=p.fname+" "+p.lname
    print(a)
    return JsonResponse({'data':a,'first_name':first_name,'photo':"/static/img.png"})
    


def user_insert_chat(request,msg):
    import datetime
    ry=chat(from_id_id=request.session['login_id'],to_id_id=request.session['dr_id'],message=msg,date_time=datetime.datetime.now())
    ry.save()
    return JsonResponse({'status':"ok"})
def labhome(request):
    return render(request,'labhome.html')

def lab_viewtest(request):
    booking_ids = bookings.objects.filter(user_id=request.session['user_ids']).values_list('booking_id', flat=True)

    # Retrieve lab test for the specified booking_ids
    qry1 = labtest.objects.filter(booking_id__in=booking_ids)

    return render(request,'lab_viewtest.html',{'qry1':qry1})
def labaddamount(request,labtest_id):
    qry1=labtest.objects.get(labtest_id=labtest_id)
    if request.method=='POST':
        am=request.POST['amt']
        qry1.test_amount=am
        qry1.test_status='accept'
        qry1.save()
        return HttpResponse("<script>alert('added successfully');window.location='/lab_viewtest' ;</script>")

    return render(request,'pharmacyaddamount.html',{'qry1':qry1})

def userpayemntto_lab(request,labtest_id,total):
   
  
    if request.method == "POST":
        q = payments(amount=total, payment_date=date.today(), booking_id=labtest_id, payment_type='lab')
        q.save()

        q1 = labtest.objects.get(labtest_id=labtest_id)
        q1.test_status= 'paid'
        q1.save()    
        return HttpResponse("<script>alert('Payment Completed....!!!');window.location='/userviewtest';</script>")
    
    return render(request,'userpayemnttopharmacy.html', {'total': total, 'labtest_id': labtest_id})


# views.py

from django.shortcuts import render
import pickle
import numpy as np
from django.shortcuts import render
import numpy as np

# Assuming 'reg1' is already loaded and available in your Django application
reg = pickle.load(open("dpapp/model.pkl", "rb"))
def hello1(request):
     return render(request,"test2.html")



def homes(request):
    data1 = float(request.POST["b"])
    data2 = float(request.POST["b"])
    data3 = float(request.POST["c"])
    data4 = float(request.POST["d"])
    d5 = float(request.POST["e"])
    d6 = float(request.POST["f"])
    d7 = float(request.POST["g"])
    d8 = float(request.POST["h"])
    d9 = float(request.POST["i"])
    d10 = float(request.POST["j"])
    d11 = float(request.POST["k"])
    d12 = float(request.POST["l"])
    d13 = float(request.POST["m"])
    d14 = float(request.POST["n"])
    d15 = float(request.POST["o"])
    d16 = float(request.POST["p"])
    d17 = float(request.POST["q"])
    d18 = float(request.POST["r"])
    d19 = float(request.POST["s"])
    d20 = float(request.POST["t"])
    d21 = float(request.POST["u"])
    d22 = float(request.POST["v"])
    d23 = float(request.POST["w"])
    d24 = float(request.POST["x"])
    d25= float(request.POST["y"])
    d26 = float(request.POST["z"])
    d27 = float(request.POST["za"])
   
   

    arr = np.array(
        [
            [
                data1,
                data2,
                data3,
                data4,
                d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,
                d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27
                            ]
        ]
    )
    pred = reg.predict(arr)
    print(pred)
    return render(request,"index1.html", {'data':pred})
