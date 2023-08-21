//
//  TaskView.swift
//  ToDoey
//
//  Created by Chase Allen on 8/19/23.
//

import SwiftUI

struct TaskView: View {
    @Binding var tasks: [ToDoItem]
    var body: some View {
        ForEach($tasks) { $task in
                HStack {
                    Button {
                        task.isDone.toggle()
                    } label: {
                        if task.isDone {
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(lineWidth: 2)
                                .frame(width: 25, height: 25)
                                .cornerRadius(5.0)
                                .overlay {
                                    Image(systemName: "checkmark")
                                }
                        } else {
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(lineWidth: 2)
                                .frame(width: 25, height: 25)
                                .cornerRadius(5.0)
                                .overlay {
                                    Image(systemName: "")
                                }
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    if task.isDone {
                        Text(task.text)
                            .strikethrough()
                    } else {
                        Text(task.text)
                    }
                    Spacer()
                    Button {
                        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
                            tasks.remove(at: index)
                        }
                    } label: {
                        Image(systemName: "minus.rectangle.fill")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(BorderlessButtonStyle())

                }
            }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}

//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView(tasks: tasks)
//    }
//}
