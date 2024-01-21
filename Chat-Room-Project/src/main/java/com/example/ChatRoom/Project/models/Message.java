package com.example.ChatRoom.Project.models;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class Message {

    private String name;

    private String content;

}
