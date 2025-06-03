from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen, SlideTransition
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.uix.floatlayout import FloatLayout
from kivy.graphics import Color, Rectangle, Line
from kivy.uix.spinner import Spinner
from kivy.uix.gridlayout import GridLayout
from kivy.uix.scrollview import ScrollView
from kivy.uix.textinput import TextInput
from kivy.uix.popup import Popup
from kivy.uix.checkbox import CheckBox
from data_models.ticket import Ticket, TicketUpdateAttendance
from data_models.event import Event, EventUpdate
from data_models.organization import Organization

import requests

def show_input_popup(on_submit_callback):
    content = BoxLayout(orientation='vertical', spacing=10, padding=10)
    
    label = Label(text="Please type the VolunteerID")
    text_input = TextInput(multiline=False) 
    
    btn_submit = Button(text="confirm", size_hint_y=None, height=40)
    
    popup = Popup(title="adding", content=content, size_hint=(0.4, 0.3))
    
    def on_submit(instance):
        user_input = text_input.text
        popup.dismiss()
        on_submit_callback(user_input) 

    btn_submit.bind(on_press=on_submit)
    
    content.add_widget(label)
    content.add_widget(text_input)
    content.add_widget(btn_submit)
    
    popup.open()

def YesOrNo_popup(on_submit_callback, text: str):
    content = BoxLayout(orientation='vertical', spacing=10, padding=10)
    
    label = Label(text="Are you sure to " + text + "?") 
    
    btn_yes = Button(text="yes", size_hint_y=None, height=40)
    btn_no = Button(text="no", size_hint_y=None, height=40)
    
    popup = Popup(title="comfirm", content=content, size_hint=(0.4, 0.3))
    
    def on_Yes(instance):
        popup.dismiss()
        on_submit_callback(True)
    def on_No(instance):
        popup.dismiss()
        on_submit_callback(False) 

    btn_yes.bind(on_press=on_Yes)
    btn_no.bind(on_press=on_No)
    
    content.add_widget(label)
    content.add_widget(btn_yes)
    content.add_widget(btn_no)
    
    popup.open()

def _update_bg(instance, value, bg_rect):
        bg_rect.size = instance.size
        bg_rect.pos = instance.pos

def create_Event_Label(text_: str, center_x: float, top: float):
    return Label(
        text = text_,
        font_size=18,
        size_hint=(0.5, 0.5),
        pos_hint={'center_x': center_x, 'top': top},
        color=(0, 0, 1, 1)
    )
    
def create_Event_TextInput(center_x: float, top: float, wide = 0.18): 
    return_TextInput = TextInput(
        hint_text="Type something...", 
        multiline=False, 
        size_hint = (wide, 0.07),
        pos_hint={'center_x': center_x, 'top': top},
    )
    return_TextInput.disabled = True
    return return_TextInput

class HomeScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)
        self.switch_func = switch_func
        layout = BoxLayout(orientation='vertical', spacing=10, padding=20)
        layout.add_widget(Label(text="Home Page", font_size=32))

        btn_Tickets = Button(text="Tickets")
        btn_Events = Button(text="Events")
        btn_vendor = Button(text="search Vendors in area")
        btn_Organization_edit = Button(text="Organization")
        layout.add_widget(btn_Tickets)
        layout.add_widget(btn_Events)
        layout.add_widget(btn_vendor)
        layout.add_widget(btn_Organization_edit)

        btn_Tickets.bind(on_press=self.on_Tickets_enter)
        btn_Events.bind(on_press=self.on_Events_enter)
        btn_vendor.bind(on_press=lambda x: switch_func("Vendors"))
        btn_Organization_edit.bind(on_press=self.on_organization_enter)

        self.add_widget(layout)
    
    def on_organization_enter(self, instance):
        org_screen = self.manager.get_screen("Organization")
        org_screen.on_buttonclick_edit_update(instance, B=True)
        response = requests.get("http://localhost:8000/organization/orgid=1")
        if response.status_code == 200:
            data = response.json()
            org_screen.input_Name.text = data["Name"]
            org_screen.input_NPOTypeID.text = str(data["NPOTypeID"])
            org_screen.input_Email.text = data["Email"]
            org_screen.input_PhoneNumber.text = data["PhoneNumber"]
            org_screen.input_AreaID.text = str(data["AreaID"])
            org_screen.input_Street.text = data["Street"]
        self.switch_func("Organization")
    
    def on_Events_enter(self, instance):
        event_screen = self.manager.get_screen("Events")
        event_screen.on_buttonclick_edit_update(instance, B=True)

        event_screen.input_EventType.text = ""
        event_screen.input_EventTime.text = ""
        event_screen.input_AreaID.text = ""
        event_screen.input_Street.text = ""
        event_screen.spinner.text='choose items'

        self.switch_func("Events") 
    
    def on_Tickets_enter(self, instance):
        ticket_screen = self.manager.get_screen("Tickets")
        ticket_screen.spinner.text='choose items'
        ticket_screen.grid.clear_widgets()

        self.switch_func("Tickets") 

class TicketsScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)
        
        #layout background
        layout = FloatLayout()
        with layout.canvas.before:
            Color(0.85, 0.92, 1, 1)  # light blue (R, G, B, A)
            self.bg_rect = Rectangle(size=layout.size, pos=layout.pos)
        layout.bind(size=lambda instance, value: _update_bg(instance, value, self.bg_rect), 
                    pos=lambda instance, value: _update_bg(instance, value, self.bg_rect))
        
        #button return
        btn_back = Button(
            background_normal='ReturnB.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 1, 'top': 1}
        )
        btn_back.bind(on_press=lambda x: switch_func("home"))

        #scroll 
        data =[]
        response = requests.get("http://localhost:8000//Organization/1/EventsList")
        if response.status_code == 200:
            data = response.json()
            eventlist = tuple(str(row['EventID']) for row in data)

        self.spinner = Spinner(
            text='choose items',
            values=eventlist,
            pos_hint={'center_x': 0.5, 'top': 0.98},
            size_hint=(0.8, 0.1),
            font_size=12
        )
        self.spinner.bind(text=self.on_spinner_select)

        #button add
        self.btn_add = Button(
            background_normal='Buttonadd.png',
            size_hint=(0.06, 0.08),
            pos_hint={'right': 1, 'top': 0.85}
        )
        self.btn_add.bind(on_press=lambda instance: show_input_popup(self.TicketAdd))
        self.btn_add.disabled = True

        #button delete
        self.btn_delete = Button(
            text='delete',
            size_hint=(0.06, 0.08),
            pos_hint={'right': 1, 'top': 0.75}
        )
        #self.btn_delete.bind(on_press=lambda instance: YesOrNo_popup(self.TicketDelete, "delete"))
        self.btn_delete.disabled = True

        #excel
        header = GridLayout(cols=4, height=40, size_hint=(0.8, None), pos_hint={'center_x': 0.5, 'top': 0.85}, spacing=10)
        headers = ['checkbox', 'TicketID', 'Name', 'Attendance']
        for col in headers:
            header.add_widget(Label(text=col, bold=True, color=(1,0,1,1), size_hint_y=None, height=40))

        scroll = ScrollView(size_hint=(0.8, 0.8), pos_hint={'center_x': 0.5, 'top': 0.75})
        self.grid = GridLayout(cols=4, height=40, size_hint_y=None, spacing=5, padding=5)
        self.grid.bind(minimum_height=self.grid.setter('height'))
        scroll.add_widget(self.grid)

        #apply to self
        layout.add_widget(self.spinner)
        layout.add_widget(btn_back)
        layout.add_widget(self.btn_add)
        layout.add_widget(self.btn_delete)
        layout.add_widget(header)  
        layout.add_widget(scroll)   
        self.add_widget(layout)    

    def add_rows(self, EventID: str):
        data =[]
        response = requests.get("http://localhost:8000/EventInform/volunteersInEvents/" + EventID)
        if response.status_code == 200:
            data = response.json()
            self.grid.clear_widgets()

        for row in data:
            checkbox = CheckBox(size_hint_y=None, height=30)
            self.grid.add_widget(checkbox)

            self.grid.add_widget(Label(text=str(row['TicketID']), size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            self.grid.add_widget(Label(text=row['Name'], size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            attend_text = "Y" if str(row['Attendance']) == "1" else "N"
            self.grid.add_widget(Label(text=attend_text, size_hint_y=None, height=30, color=(0, 0, 1, 1)))

    def on_spinner_select(self, spinner, text):
        if self.spinner.text !='choose items':
            self.btn_add.disabled = False
            self.btn_delete.disabled = False
        self.add_rows(text)
    
    def TicketAdd(self, text):
        ticket = Ticket(VolunteerID = text, EventID = self.spinner.text)
        esponse = requests.post("http://localhost:8000/AddTickets/", data=ticket.json())
        self.on_spinner_select(self.spinner, self.spinner.text)

    def TicketDelete(self, YesOrNo):
        #if YesOrNo:
            #ticket = TicketUpdateAttendance(TicketID = , EventID =)
            #esponse = requests.put("http://localhost:8000/UpdateEvents/", data=ticket.json())
        self.on_spinner_select(self.spinner, self.spinner.text)

class EventsScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)
        
        #layout background
        layout = FloatLayout()
        with layout.canvas.before:
            Color(0.85, 0.92, 1, 1)  # light blue (R, G, B, A)
            self.bg_rect = Rectangle(size=layout.size, pos=layout.pos)
        layout.bind(size=lambda instance, value: _update_bg(instance, value, self.bg_rect), 
                    pos=lambda instance, value: _update_bg(instance, value, self.bg_rect))
        
        #button return
        btn_back = Button(
            background_normal='ReturnB.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 1, 'top': 1}
        )
        btn_back.bind(on_press=lambda x: switch_func("home"))

        #scroll 
        data =[]
        response = requests.get("http://localhost:8000//Organization/1/EventsList")
        if response.status_code == 200:
            data = response.json()
            eventlist = tuple(str(row['EventID']) for row in data)

        self.spinner = Spinner(
            text='choose items',
            values=eventlist,
            pos_hint={'center_x': 0.5, 'top': 0.98},
            size_hint=(0.8, 0.1),
            font_size=12
        )
        self.spinner.bind(text=self.on_spinner_select)

        #lable for event
        self.EventType_ = create_Event_Label(text_="EventType", center_x=0.1, top=1)
        self.EventTime_ = create_Event_Label(text_="EventTime", center_x=0.35, top=1)
        self.AreaID_ = create_Event_Label(text_="Area", center_x=0.6, top=1)
        self.Street_ = create_Event_Label(text_="Street", center_x=0.85, top=1)

        #TextInput for event
        self.input_EventType = create_Event_TextInput(center_x=0.15, top=0.7)
        self.input_EventTime = create_Event_TextInput(center_x=0.4, top=0.7)
        self.input_AreaID = create_Event_TextInput(center_x=0.65, top=0.7)
        self.input_Street = create_Event_TextInput(center_x=0.9, top=0.7)

        # button edit
        self.btn_edit = Button(
            background_normal='edit.png',
            size_hint=(0.05, 0.07),
            pos_hint={'right': 0.85, 'top': 0.5}
        )
        self.btn_edit.bind(on_press=lambda instance: self.on_buttonclick_editing(B=False))

        # button update
        self.btn_update = Button(
            background_normal='check.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 0.95, 'top': 0.5}
        )
        self.btn_update.disabled = True
        self.btn_update.bind(on_press=lambda instance: YesOrNo_popup(self.on_buttonclick_update, "update"))

        #apply to self
        layout.add_widget(self.EventType_)
        layout.add_widget(self.EventTime_)
        layout.add_widget(self.AreaID_)
        layout.add_widget(self.Street_)

        layout.add_widget(self.input_EventType)
        layout.add_widget(self.input_EventTime)
        layout.add_widget(self.input_AreaID)
        layout.add_widget(self.input_Street)

        layout.add_widget(btn_back)
        layout.add_widget(self.btn_edit)
        layout.add_widget(self.btn_update)
        layout.add_widget(self.spinner)
        self.add_widget(layout)

    def on_spinner_select(self, spinner, text):
        data =[]
        response = requests.get("http://localhost:8000/Event=" + text)
        if response.status_code == 200:
            data = response.json()
            for row in data:
                self.input_EventType.text = row['EventType']
                self.input_EventTime.text = row['EventTime']
                self.input_AreaID.text = str(row['AreaID'])
                self.input_Street.text = row['Street']
    
    def on_buttonclick_edit_update(self, instance=None, B=False):
        self.input_EventType.disabled = B
        self.input_EventTime.disabled = B
        self.input_AreaID.disabled = B
        self.input_Street.disabled = B
        self.btn_edit.disabled = not B
        self.btn_update.disabled = B

    def on_buttonclick_editing(self, B):
        if self.spinner.text !='choose items':
            self.on_buttonclick_edit_update(B)

    def on_buttonclick_update(self, YesOrNo):
        if YesOrNo:
            event = EventUpdate(EventID = self.spinner.text, event_type = self.input_EventType.text, event_time =self.input_EventTime.text , org_id = 1, area_id = self.input_AreaID.text, street = self.input_Street.text)
            esponse = requests.put("http://localhost:8000/UpdateEvents/", data=event.json())
        self.on_spinner_select(self.spinner, self.spinner.text)
        self.on_buttonclick_edit_update(B=True)


class VendorsScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)

        #layout background
        layout = FloatLayout()
        with layout.canvas.before:
            Color(0.85, 0.92, 1, 1)  # light blue (R, G, B, A)
            self.bg_rect = Rectangle(size=layout.size, pos=layout.pos)
        layout.bind(size=lambda instance, value: _update_bg(instance, value, self.bg_rect), 
                    pos=lambda instance, value: _update_bg(instance, value, self.bg_rect))

        #button
        btn_back = Button(
            background_normal='ReturnB.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 1, 'top': 1}
        )
        btn_back.bind(on_press=lambda x: switch_func("home"))

        #scroll 
        data =[]
        response = requests.get("http://localhost:8000/areas/")
        if response.status_code == 200:
            data = response.json()
            self.spinner_map = {}
            for row in data:
                self.spinner_map[row['Country'] + ', ' + row['State'] + ', ' + row['City'] + ', ' + row['ZIP']] = row['AreaID']

        self.spinner = Spinner(
            text='choose items',
            values=tuple(self.spinner_map.keys()),
            pos_hint={'center_x': 0.5, 'top': 0.98},
            size_hint=(0.8, 0.1),
            font_size=12
        )
        self.spinner.bind(text=self.on_spinner_select)

        #excel
        header = GridLayout(cols=5, height=40, size_hint=(0.8, None), pos_hint={'center_x': 0.5, 'top': 0.85}, spacing=10)
        headers = ['VendorID', 'Name', 'Type', 'CanDeliver', 'PhoneNumber']
        for col in headers:
            header.add_widget(Label(text=col, bold=True, color=(1,0,1,1), size_hint_y=None, height=40))

        scroll = ScrollView(size_hint=(0.8, 0.8), pos_hint={'center_x': 0.5, 'top': 0.75})
        self.grid = GridLayout(cols=5, height=40, size_hint_y=None, spacing=5, padding=5)
        self.grid.bind(minimum_height=self.grid.setter('height'))
        scroll.add_widget(self.grid)

        #apply to self
        layout.add_widget(btn_back)
        layout.add_widget(self.spinner)
        layout.add_widget(header)
        layout.add_widget(scroll)
        self.add_widget(layout)

    def add_rows(self, AreaID: str):
        data =[]
        response = requests.get("http://localhost:8000/vendors/area=" + str(AreaID))
        if response.status_code == 200:
            data = response.json()
            self.grid.clear_widgets()

        for row in data:
            self.grid.add_widget(Label(text=str(row['VendorID']), size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            self.grid.add_widget(Label(text=row['Name'], size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            self.grid.add_widget(Label(text=row['Type'], size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            attend_text = "Y" if str(row['CanDeliver']) == "1" else "N"
            self.grid.add_widget(Label(text=attend_text, size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            self.grid.add_widget(Label(text=row['PhoneNumber'], size_hint_y=None, height=30, color=(0, 0, 1, 1)))

    def on_spinner_select(self, spinner, text):
        self.add_rows(self.spinner_map[text])

class OrganizationScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)

        #layout background
        layout = FloatLayout()
        with layout.canvas.before:
            Color(0.85, 0.92, 1, 1)  # light blue (R, G, B, A)
            self.bg_rect = Rectangle(size=layout.size, pos=layout.pos)
        layout.bind(size=lambda instance, value: _update_bg(instance, value, self.bg_rect), 
                    pos=lambda instance, value: _update_bg(instance, value, self.bg_rect))
        
        #button return
        btn_back = Button(
            background_normal='ReturnB.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 1, 'top': 1}
        )
        btn_back.bind(on_press=lambda x: switch_func("home"))

        #lable for Organization
        self.Name = create_Event_Label(text_="Name", center_x=0.09, top=1)
        self.NPOTypeID = create_Event_Label(text_="NPOTypeID", center_x=0.36, top=1)
        self.Email = create_Event_Label(text_="Email", center_x=0.58, top=1)
        self.PhoneNumber = create_Event_Label(text_="PhoneNumber", center_x=0.12, top=0.8)
        self.AreaID = create_Event_Label(text_="AreaID", center_x=0.34, top=0.8)
        self.Street = create_Event_Label(text_="Street", center_x=0.58, top=0.8)

        #TextInput for Organization
        self.input_Name = create_Event_TextInput(center_x=0.15, top=0.7)
        self.input_NPOTypeID = create_Event_TextInput(center_x=0.4, top=0.7)
        self.input_Email = create_Event_TextInput(center_x=0.7, top=0.7, wide = 0.3)
        self.input_PhoneNumber = create_Event_TextInput(center_x=0.15, top=0.5)
        self.input_AreaID = create_Event_TextInput(center_x=0.4, top=0.5)
        self.input_Street = create_Event_TextInput(center_x=0.7, top=0.5, wide = 0.3)
    
        # button edit
        self.btn_edit = Button(
            background_normal='edit.png',
            size_hint=(0.05, 0.07),
            pos_hint={'right': 0.85, 'top': 0.3}
        )
        self.btn_edit.bind(on_press=lambda instance: self.on_buttonclick_edit_update(instance, B=False))

        # button update
        self.btn_update = Button(
            background_normal='check.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 0.95, 'top': 0.3}
        )
        self.btn_update.disabled = True
        self.btn_update.bind(on_press=lambda instance: YesOrNo_popup(self.on_buttonclick_update, "update"))

        #apply to self
        layout.add_widget(self.Name)
        layout.add_widget(self.NPOTypeID)
        layout.add_widget(self.Email)
        layout.add_widget(self.PhoneNumber)
        layout.add_widget(self.AreaID)
        layout.add_widget(self.Street)

        layout.add_widget(self.input_Name)
        layout.add_widget(self.input_NPOTypeID)
        layout.add_widget(self.input_Email)
        layout.add_widget(self.input_PhoneNumber)
        layout.add_widget(self.input_AreaID)
        layout.add_widget(self.input_Street)

        layout.add_widget(btn_back)
        layout.add_widget(self.btn_edit)
        layout.add_widget(self.btn_update)
        self.add_widget(layout)

    def on_buttonclick_edit_update(self, instance=None, B=False):
        self.input_Name.disabled = B
        self.input_NPOTypeID.disabled = B
        self.input_Email.disabled = B
        self.input_PhoneNumber.disabled = B
        self.input_AreaID.disabled = B
        self.input_Street.disabled = B
        self.btn_edit.disabled = not B
        self.btn_update.disabled = B
    def on_buttonclick_update(self, YesOrNo):
        if YesOrNo:
            organization = Organization(org_id = 1, 
                                              name = self.input_Name.text, 
                                              npotype_id = int(self.input_NPOTypeID.text), 
                                              email = self.input_Email.text, 
                                              phone_number = self.input_PhoneNumber.text, 
                                              area_id = int(self.input_AreaID.text),
                                              street = self.input_Street.text)
            esponse = requests.put("http://localhost:8000/UpdateOrganization", data=organization.json())

        response = requests.get("http://localhost:8000/organization/orgid=1")
        if response.status_code == 200:
            data = response.json()
            self.input_Name.text = data["Name"]
            self.input_NPOTypeID.text = str(data["NPOTypeID"])
            self.input_Email.text = data["Email"]
            self.input_PhoneNumber.text = data["PhoneNumber"]
            self.input_AreaID.text = str(data["AreaID"])
            self.input_Street.text = data["Street"]
        self.on_buttonclick_edit_update(B=True)


class MobileStyleApp(App):
    def build(self):
        self.sm = ScreenManager()

        def switch_screen(target_name):
            current = self.sm.current
            screens_order = ["home", "Tickets", "Events", "Vendors", "Organization"]
            direction = "left" if screens_order.index(target_name) > screens_order.index(current) else "right"
            self.sm.transition = SlideTransition(direction=direction)
            self.sm.current = target_name

        # 傳 switch_func 進去每個頁面
        self.sm.add_widget(HomeScreen(name="home", switch_func=switch_screen))
        self.sm.add_widget(TicketsScreen(name="Tickets", switch_func=switch_screen))
        self.sm.add_widget(EventsScreen(name="Events", switch_func=switch_screen))
        self.sm.add_widget(VendorsScreen(name="Vendors", switch_func=switch_screen))
        self.sm.add_widget(OrganizationScreen(name="Organization", switch_func=switch_screen))

        return self.sm

MobileStyleApp().run()
