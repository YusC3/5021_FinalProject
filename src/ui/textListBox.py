from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.scrollview import ScrollView
from kivy.uix.gridlayout import GridLayout
from kivy.uix.behaviors import ButtonBehavior
from kivy.uix.textinput import TextInput
from kivy.uix.spinner import Spinner
from kivy.uix.button import Button


# 自訂項目元件（看起來像 Label，但能點）
class SelectableLabel(ButtonBehavior, Label):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.size_hint_y = None
        self.height = 40
        self.font_size = 16
        self.color = (0, 0, 0, 1)  # 黑字

    def on_press(self):
        # 這裡的處理在主畫面綁定，不需要寫死
        pass


class ListBoxDemo(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', **kwargs)

        # 顯示目前選擇
        self.label = Label(text="pick up an item", size_hint_y=0.1, font_size=18, color=(0, 0, 0, 1))
        self.add_widget(self.label)

        # 建立可滾動清單
        scroll = ScrollView(size_hint=(1, 0.9))
        self.grid = GridLayout(cols=1, size_hint_y=None, spacing=10, padding=10)
        self.grid.bind(minimum_height=self.grid.setter('height'))
        scroll.add_widget(self.grid)
        self.add_widget(scroll)

        # 加入商品項目
        self.add_items([
            {'name': 'A', 'qty': 3, 'price': 100},
            {'name': 'B', 'qty': 1, 'price': 250},
            {'name': 'C', 'qty': 5, 'price': 30},
        ])

    def add_items(self, items):
        for item in items:
            text = f"{item['name']} amount: {item['qty']} price: ${item['price']}"
            lbl = SelectableLabel(text=text)
            lbl.color = (1, 0, 0, 1)  # 將文字設為紅色
            lbl.bind(on_press=self.on_select)
            self.grid.add_widget(lbl)

    def on_select(self, instance):
        self.label.text = f"pick: {instance.text}"
        self.label.color = (1, 0, 0, 1)


class TextBoxDemo(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', spacing=10, padding=20, **kwargs)

        self.label = Label(text="請輸入內容...", size_hint_y=0.3, font_size=20)
        self.text_input = TextInput(
            hint_text='請在這裡輸入文字',
            multiline=False,             # 單行文字輸入框
            size_hint_y=0.2,
            font_size=18
        )

        # 當文字改變時，更新 Label
        self.text_input.bind(text=self.on_text_change)

        self.add_widget(self.label)
        self.add_widget(self.text_input)

    def on_text_change(self, instance, value):
        self.label.text = f"你輸入了：{value}"

class DropdownDemo(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', spacing=10, padding=20, **kwargs)

        self.label = Label(text="請選擇一項商品", size_hint_y=0.3, font_size=20)

        # 建立下拉選單 Spinner
        self.spinner = Spinner(
            text='選擇商品',
            values=('商品 A', '商品 B', '商品 C'),
            size_hint_y=0.2,
            font_size=18
        )

        # 綁定選擇事件
        self.spinner.bind(text=self.on_select)

        self.add_widget(self.spinner)
        self.add_widget(self.label)
        

    def on_select(self, spinner, text):
        self.label.text = f"你選擇了：{text}"

class ExcelLikeTable(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(orientation='vertical', padding=10, spacing=10, **kwargs)

        # 表頭
        header = GridLayout(cols=3, size_hint_y=None, height=40)
        headers = ['item', 'amount', 'price']
        for col in headers:
            header.add_widget(Label(text=col, bold=True, color=(1,1,1,1), size_hint_y=None, height=40))

        header_canvas = BoxLayout()
        header_canvas.add_widget(header)
        self.add_widget(header_canvas)

        # 表格內容（可滾動）
        scroll = ScrollView(size_hint=(1, 1))
        self.grid = GridLayout(cols=3, size_hint_y=None, spacing=5)
        self.grid.bind(minimum_height=self.grid.setter('height'))
        scroll.add_widget(self.grid)
        self.add_widget(scroll)

        # 假資料
        data = [
            {'name': 'A', 'qty': 3, 'price': 100},
            {'name': 'B', 'qty': 5, 'price': 200},
            {'name': 'C', 'qty': 2, 'price': 150},
            {'name': 'D', 'qty': 8, 'price': 180},
            {'name': 'E', 'qty': 1, 'price': 300},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': 'F', 'qty': 10, 'price': 90},
            {'name': '123', 'qty': 10, 'price': 90}
        ]

        self.add_rows(data)

    def add_rows(self, data):
        for row in data:
            self.grid.add_widget(Label(text=row['name'], size_hint_y=None, height=30))
            self.grid.add_widget(Label(text=str(row['qty']), size_hint_y=None, height=30))
            self.grid.add_widget(Label(text=f"${row['price']}", size_hint_y=None, height=30))


class MyApp(App):
    def build(self):
        layout = BoxLayout(orientation='vertical', padding=20, spacing=10)

        self.input = TextInput(hint_text="Type something...", multiline=False, size_hint = (0.5, 0.1))
        self.input.disabled = True
        btn = Button(text="Submit")
        self.label = Label(text="")

        btn.bind(on_press=self.show_input)

        layout.add_widget(self.input)
        layout.add_widget(btn)
        layout.add_widget(self.label)

        return layout
    
    def show_input(self, instance):
        self.label.text = f"You typed: {self.input.text}"


if __name__ == '__main__':
    MyApp().run()
