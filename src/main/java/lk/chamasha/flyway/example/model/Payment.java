package lk.chamasha.flyway.example.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
@Table(name = "payments")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double amount;
    private String method;
    private LocalDateTime paidAt;

    @OneToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;
}
