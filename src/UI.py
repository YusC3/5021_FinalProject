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

import main as m
import requests
import json

class HomeScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)
        layout = BoxLayout(orientation='vertical', spacing=10, padding=20)
        layout.add_widget(Label(text="Home Page", font_size=32))

        btn_inventory = Button(text="Tickets")
        btn_customer = Button(text="Events")
        layout.add_widget(btn_inventory)
        layout.add_widget(btn_customer)

        btn_inventory.bind(on_press=lambda x: switch_func("Tickets"))
        btn_customer.bind(on_press=lambda x: switch_func("Events"))

        self.add_widget(layout)

class TicketsScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)
        
        #layout background
        layout = FloatLayout()
        with layout.canvas.before:
            Color(0.85, 0.92, 1, 1)  # 淡藍色 (R, G, B, A)
            self.bg_rect = Rectangle(size=layout.size, pos=layout.pos)
        layout.bind(size=self._update_bg, pos=self._update_bg)
        
        #button
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
        btn_add = Button(
            background_normal='Buttonadd.png',
            size_hint=(0.06, 0.08),
            pos_hint={'right': 1, 'top': 0.85}
        )
        #btn_add.bind(on_press=lambda x: switch_func("home"))

        #excel
        header = GridLayout(cols=3, height=40, size_hint=(0.8, None), pos_hint={'center_x': 0.5, 'top': 0.85}, spacing=10)
        headers = ['TicketID', 'Name', 'Attendance']
        for col in headers:
            header.add_widget(Label(text=col, bold=True, color=(1,0,1,1), size_hint_y=None, height=40))

        scroll = ScrollView(size_hint=(0.8, 0.8), pos_hint={'center_x': 0.5, 'top': 0.75})
        self.grid = GridLayout(cols=3, height=40, size_hint_y=None, spacing=5, padding=5)
        self.grid.bind(minimum_height=self.grid.setter('height'))
        scroll.add_widget(self.grid)

        #apply to slef
        layout.add_widget(self.spinner)
        layout.add_widget(btn_back)
        layout.add_widget(btn_add)
        layout.add_widget(header)     
        self.add_widget(layout)
        self.add_widget(scroll)

    def _update_bg(self, instance, value):
        self.bg_rect.size = instance.size
        self.bg_rect.pos = instance.pos
    
    def add_rows(self, EventID: str):
        data =[]
        response = requests.get("http://localhost:8000/EventInform/volunteersInEvents/" + EventID)
        if response.status_code == 200:
            data = response.json()
            self.grid.clear_widgets()

        print(data)
        for row in data:
            self.grid.add_widget(Label(text=str(row['TicketID']), size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            self.grid.add_widget(Label(text=row['Name'], size_hint_y=None, height=30, color=(0, 0, 1, 1)))
            attend_text = "Y" if str(row['Attendance']) == "1" else "N"
            self.grid.add_widget(Label(text=attend_text, size_hint_y=None, height=30, color=(0, 0, 1, 1)))


    def on_spinner_select(self, spinner, text):
        self.add_rows(text)

class EventsScreen(Screen):
    def __init__(self, switch_func, **kwargs):
        super().__init__(**kwargs)
        layout = FloatLayout()

        btn_back = Button(
            background_normal='ReturnB.png',
            size_hint=(0.08, 0.08),
            pos_hint={'right': 1, 'top': 1}
        )
        btn_back.bind(on_press=lambda x: switch_func("home"))

        title = Label(
            text="Events Page",
            font_size=32,
            size_hint=(None, None),
            pos_hint={'center_x': 0.5, 'top': 0.9}
        )

        layout.add_widget(title)
        layout.add_widget(btn_back)
        self.add_widget(layout)

class MobileStyleApp(App):
    def build(self):
        self.sm = ScreenManager()

        def switch_screen(target_name):
            current = self.sm.current
            screens_order = ["home", "Tickets", "Events"]
            direction = "left" if screens_order.index(target_name) > screens_order.index(current) else "right"
            self.sm.transition = SlideTransition(direction=direction)
            self.sm.current = target_name

        # 傳 switch_func 進去每個頁面
        self.sm.add_widget(HomeScreen(name="home", switch_func=switch_screen))
        self.sm.add_widget(TicketsScreen(name="Tickets", switch_func=switch_screen))
        self.sm.add_widget(EventsScreen(name="Events", switch_func=switch_screen))

        return self.sm

MobileStyleApp().run()
