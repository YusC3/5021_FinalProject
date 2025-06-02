from kivy.uix.popup import Popup
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button

def show_input_popup(on_submit_callback):
    # 建立彈窗內部的布局
    content = BoxLayout(orientation='vertical', spacing=10, padding=10)
    
    label = Label(text="請輸入內容：")
    text_input = TextInput(multiline=False)
    
    btn_submit = Button(text="確定", size_hint_y=None, height=40)
    
    popup = Popup(title="輸入視窗", content=content, size_hint=(0.7, 0.4))
    
    # 點擊按鈕時觸發 callback 並關閉 popup
    def on_submit(instance):
        user_input = text_input.text
        popup.dismiss()
        on_submit_callback(user_input)  # 執行傳入的函式

    btn_submit.bind(on_press=on_submit)
    
    content.add_widget(label)
    content.add_widget(text_input)
    content.add_widget(btn_submit)
    
    popup.open()
