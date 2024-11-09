package com.ipay.generic;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/generic")
public class GenericController {
    @GetMapping()
    ResponseEntity<?> Test(){
        return ResponseEntity.ok("Working");
    }
}
